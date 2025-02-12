#!/bin/bash

### Variáveis auxiliares ###
debug_mode_warning=1
debug_mode_stdout=1
stdout=''
stderr=''

### Funções ###
log_step_progress() {
    local middle_message=$1

    printf '%*s' 19 | tr ' ' '-' ; echo -n "${middle_message}" ; printf '%*s\n' 19 | tr ' ' '-'
}

log_function() {
    local log_message=$1
    local log_level="${2:-INFO}"

    echo -e "$(date '+[%Y-%m-%d %H:%M:%S]')[${log_level}] ${log_message}"
}

validate_success() {
    local command=$1
    local error_message=$2
    local debug_message=$3
    local warning_message=$4
    local command_exit_code=''
    local stderr_file=$(mktemp)

    stdout=$(eval "${command}" 2>"${stderr_file}")
    command_exit_code=$?
    stderr=$(<"${stderr_file}")
    rm -f "${stderr_file}"

    if [[ $command_exit_code -ne 0 ]]; then
        log_function "${error_message}${stderr}" 'ERROR'
        exit 1
    fi

    if [[ $debug_mode_warning -eq 1 && -n "${stderr}" ]]; then
        log_function "${warning_message}${stderr}" 'WARNING'
    fi

    if [[ $debug_mode_stdout -eq 1 && -n "${stdout}" ]]; then
        log_function "${debug_message}${stdout}" 'DEBUG'
    fi
}

#debug_mode_warning=0
#debug_mode_stdout=0

### Execução principal do script ###
#log_step_progress ' Preparando o ambiente para a instalação das aplicações '
#log_function 'sudo apt update'
#validate_success 'sudo apt update' 'Erro ao atualizar os índices de pacotes:' '\n'
#log_function 'sudo apt upgrade -y'
#validate_success 'sudo apt upgrade -y' 'Erro ao atualizar os pacotes:' '\n'

# Google Chrome
# TODO: Consigo logar nele através do script?
#log_function 'Baixando o Google Chrome\n'
#validate_success 'wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb' '' '' '\n'
#log_step_progress '-------------- Instalando o Google Chrome --------------'
#validate_success 'sudo dpkg -i google-chrome-stable_current_amd64.deb || sudo apt install -fy' '' '\n'
#log_function "$(google-chrome --version)\n"
#validate_success 'rm google-chrome-stable_current_amd64.deb'

# Multipass
#log_step_progress '---------------- Instalando o Multipass ----------------'
#validate_success 'sudo snap install multipass > /dev/null'
log_function "$(echo 'Multipass ')$(multipass version)"
multipass version
#stdout="$(multipass version)"
#log_function "$(echo "${stdout:0:1}" | tr '[[:lower:]]' '[[:upper:]]')$(echo "${stdout:1}" | tr -d '\n' | sed -E 's/([0-9]+(\.[0-9]+)*).*/\1/; s/[[:space:]]+/ /')\n"
#<F

# VS Code
#log_step_progress '----------------- Instalando o VS Code -----------------'
#validate_success 'sudo snap install code --classic > /dev/null'
#log_function "$(echo 'VS Code ')$(code --version | sed -z 's/\n.*//')\n"

# Discord
#log_step_progress '----------------- Instalando o Discord -----------------'
#validate_success 'sudo snap install discord > /dev/null'
#log_function "$(echo 'Discord ')$(snap info discord | grep installed | sed -E 's/^[^0-9]*//; s/([0-9]+(\.[0-9]+)*).*/\1/')\n"

# Git
#log_step_progress '------------------- Instalando o Git -------------------'
#validate_success 'sudo apt install git -y' 'Erro ao instalar o Git:' '\n'
#log_function "$(echo 'Git ')$(git --version | sed -E 's/^[^0-9]*//')\n"

# MariaDB
#log_step_progress '----------------- Instalando o MariaDB -----------------'
#validate_success 'sudo apt install mariadb-server -y' 'Erro ao instalar o MariaDB:'
#stdout="$(mariadb --version)"
#log_function "$(echo 'MariaDB ')$(echo ${stdout:13:28})"