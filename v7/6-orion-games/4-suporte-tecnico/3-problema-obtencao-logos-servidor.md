# Problema com a Obtenção das Logos do Servidor

- Altere o servidor para o ambiente RC
- Reinicie o Updater (zoe-updater) com o comando `systemctl restart zoe-updater`
- Confirme que a versão do Updater agora é `zoeslots/zoe-updater@1.6.14-rc` (verifique utilizando `npm list -g --depth=0`)
- Aguarde a execução completa do ciclo do Updater
- Retorne o ambiente do servidor para PROD
- Reinicie o Updater novamente
- Verifique se o diretório **/data/games/logo** contém os seguintes quatro arquivos:
    + **logo-xbl.png**
    + **logo-xbr.png**
    + **logo-xul.png**
    + **logo-xur.png**

A funcionalidade de obtenção das logos está disponível apenas na versão RC do Updater. A versão de PROD ainda não incluir essa feature.

# [[ Voltar para: Suporte Técnico ]](./1-suporte-tecnico.md)