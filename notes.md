Para instalar o MariaDB no Ubuntu via terminal, siga os seguintes passos:

1. **Atualize o índice de pacotes:**
   ```bash
   sudo apt update
   ```

2. **Instale o MariaDB:**
   ```bash
   sudo apt install mariadb-server
   ```

3. **Verifique se o MariaDB foi instalado corretamente:**
   ```bash
   sudo systemctl status mariadb
   ```
   Este comando vai exibir o status do serviço MariaDB. Se estiver ativo e em execução, a instalação foi bem-sucedida.

4. **Execute a segurança inicial do MariaDB:**
   Para melhorar a segurança, execute o seguinte script:
   ```bash
   sudo mysql_secure_installation
   ```
   Este comando configura a senha de root e faz ajustes de segurança.

5. **Acesse o MariaDB:**
   Após a instalação, você pode acessar o banco de dados com o comando:
   ```bash
   sudo mysql -u root -p
   ```
   Digite a senha que você configurou durante o processo de instalação.

Com esses passos, o MariaDB estará instalado e configurado no seu sistema Ubuntu!