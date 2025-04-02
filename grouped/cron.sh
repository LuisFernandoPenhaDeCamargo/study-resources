#!/bin/bash

# TODO (LF):
# - Quando testarmos o script em mais servidores RC, ajustaremos o log para torná-lo mais enxuto
# - Conforme validarmos a necessidade de tabelas e colunas, atualizaremos o conteúdo a ser utilizado na criação do dump. O objetivo do dump é ser utilizado na regravação
# dos servidores <F estátistica
# - Criar uma aplicação que forneça os dados sensíveis para o script, para que eles não fiquem visíveis
# - Criar um script de configuração central, agrupando todas as instalações e configurações necessárias para o servidor

### Utilitários adicionais ###
touch /var/log/orion-database-dump-generator.log
exec > /var/log/orion-database-dump-generator.log 2>&1
#exec >> /var/log/orion-database-dump-generator.log 2>&1

if ! command -v msmtp &>/dev/null; then
    echo 'msmtp msmtp/profile string /etc/apparmor.d/usr.bin.msmtp' | debconf-set-selections
    echo 'msmtp msmtp/apply_apparmor boolean true' | debconf-set-selections
    #apt update &>/dev/null && DEBIAN_FRONTEND=noninteractive apt install -y msmtp &>/dev/null
    DEBIAN_FRONTEND=noninteractive apt install -y msmtp &>/dev/null

    cat > /etc/msmtprc <<EOF
account default
host smtp.gmail.com
port 587
auth on
tls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt
user fernando.penha.orion@gmail.com
password zaqouvetwrcoqirs
from fernando.penha.orion@gmail.com
logfile /var/log/msmtp.log
EOF
fi

### Credenciais, variáveis de configuração e auxiliares ###
DB_HOST='localhost'
DB_PORT='3306'
DB_NAME='zoeslots'
DB_USER='orion'
DB_PASS='Bl4ckBox1337'
DB_TABLE='lanhouse_log'
DB_COLUMN='created'
HOST_ID=$(hostname | sed -E 's/-.*//')
S3_BUCKET="s3://orion-island-dumps/${HOST_ID}/"

DATE=$(date '+%Y-%m-%d')
THRESHOLD_DATE=$(date -d "${DATE} -1 month" '+%Y-%m-%d') <F faixa para deletar registros
DUMP_DIR='/home/zoe/dumps'

command_output=''

### Funções ###
log_step_progress() {
    local middle_message=$1

    printf '%*s' 29 | tr ' ' '-' ; echo -n "${middle_message}" ; printf '%*s\n' 29 | tr ' ' '-'
}

log_message() {
    local log_message=$1
    local log_level="${2:-INFO}"

    echo -e "$(date '+[%Y-%m-%d %H:%M:%S]')[${log_level}] ${log_message}"
}

validate_success() {
    local command=$1
    local error_message=$2

    command_output=$(eval "${command} 2>&1")

    if [ $? -ne 0 ]; then

        command_output=$(echo $command_output | tr -d '\n')
        log_message "${error_message}. ${command_output}" 'ERROR'
        echo -e "Subject: orion-database-dump-generator\n\n[${HOST_ID}][ERROR] ${command_output}." | msmtp fernando.penha@orion-gaming.com
        exit 1
    fi
}

### Execução Principal do Script ###
log_step_progress "Time zone: ($(date +%z))"
log_message "Starting the database dump generation process...\n"

log_step_progress "------Step 1------"
log_message 'Starting the service status verification phase...'
log_step_progress "-----Step 1.1-----"
log_message 'Checking local database connectivity...'
validate_success "nc -vz -w5 ${DB_HOST} ${DB_PORT}" "Problem connecting to MySQL on host ${DB_HOST} and port ${DB_PORT}"
log_message "${command_output}"

log_step_progress "-----Step 1.2-----"
log_message 'Checking local database response...'
validate_success "mariadb -u ${DB_USER} -p${DB_PASS} ${DB_NAME} -e 'SELECT 1;'" 'Local database is not responding to queries'
log_message "Local database response was successful\n"

log_step_progress "------Step 2------"
log_message 'Starting the data cleanup and export phase...'

log_step_progress "-----Step 2.1-----"
log_message "Calculating the number of records in the ${DB_TABLE} table..."
validate_success "mariadb -u ${DB_USER} -p${DB_PASS} ${DB_NAME} -e 'SELECT COUNT(*) AS total FROM ${DB_TABLE};'" "Failed to count records in the '${DB_TABLE}' table"
log_message "Number of records: $(echo ${command_output} | tr -d '\n' | sed -E 's/[^0-9]//g')"

log_step_progress "-----Step 2.2-----"
log_message 'Dumping database to local file...'
validate_success "(mysqldump -u ${DB_USER} -p${DB_PASS} ${DB_NAME} --single-transaction --routines --triggers --hex-blob > ${DUMP_DIR}/${HOST_ID}_${DATE}_dump.sql)" \
    'Failed to create database dump'
log_message "Database dump successfully created: ${HOST_ID}_${DATE}_dump.sql"

log_step_progress "-----Step 2.3-----"
log_message "Checking if the ${HOST_ID}_${DATE}_dump.sql exists and is not empty..."
if [ ! -s "${DUMP_DIR}/${HOST_ID}_${DATE}_dump.sql" ]; then
    log_message "The file ${HOST_ID}_${DATE}_dump.sql does not exist or is empty" 'ERROR'
    exit 1
fi
log_message "The file ${HOST_ID}_${DATE}_dump.sql was found and is not empty"

log_step_progress "-----Step 2.4-----"
MARIADB_FOOTER=$(tail -n 2 "${DUMP_DIR}/${HOST_ID}_${DATE}_dump.sql" | grep -F "Dump completed on")
log_message 'Checking if the SQL dump file contains a valid completion footer...'
if [ -z "$MARIADB_FOOTER" ]; then
    log_message 'The SQL dump file does not contain a valid completion footer' 'ERROR'
    exit 1
fi
log_message "The SQL dump file contains a valid completion footer: \"${MARIADB_FOOTER}\""

log_step_progress "-----Step 2.5-----"
log_message "Deleting old records from the ${DB_TABLE} table..."
validate_success "mariadb -u ${DB_USER} -p${DB_PASS} ${DB_NAME} -e \"DELETE FROM ${DB_TABLE} WHERE ${DB_COLUMN} < '${THRESHOLD_DATE}';\"" "Failed to delete old records from the ${DB_TABLE} table"
log_message "Successfully deleted old records from ${DB_TABLE} table"

log_step_progress "-----Step 2.6-----"
log_message "Recounting records in the ${DB_TABLE} table..."
validate_success "mariadb -u ${DB_USER} -p${DB_PASS} ${DB_NAME} -e 'SELECT COUNT(*) AS total FROM ${DB_TABLE};'" "Failed to recount records in the '${DB_TABLE}' table"
log_message "New number of records: $(echo ${command_output} | tr -d '\n' | sed -E 's/[^0-9]//g')\n"

log_step_progress "------Step 3------"
log_message 'Compressing files...'
validate_success "cd ${DUMP_DIR} && gzip -f ${HOST_ID}_${DATE}_dump.sql" 'Failed to compress the database dump'
log_message "Database dump successfully compressed\n"

log_step_progress "------Step 4------"
log_message 'Starting the upload of the compressed database dump to S3...'
validate_success "aws s3 cp ${DUMP_DIR}/${HOST_ID}_${DATE}_dump.sql.gz ${S3_BUCKET}" 'Failed to upload the compressed database dump to S3'
log_message "Database dump successfully uploaded to S3"