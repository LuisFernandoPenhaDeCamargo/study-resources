# Problema com a Obtenção das Logos do Servidor

TODO: Revisão:
- Coloque o servidor em RC
- Reinicie o Updater (zoe-updater) com `systemctl restart zoe-updater`
- `zoeslots/zoe-updater@1.6.14-rc` (`npm list -g --depth=0`) será a versão do Updater
- Após o término da execução do ciclo do Updater, volte o environment para PROD
- Reinicie o Updater novamente
- O diretório **/data/games/logo** deverá conter quatro arquivos:
    + **logo-xbl.pgn**
    + **logo-xbr.pgn**
    + **logo-xul.pgn**
    + **logo-xur.pgn**

O que está acontecendo é que a versão do Updater que contém a feature de obter a logo é a versão RC, a versão de PROD nunca foi lançada.

# [[ Voltar para: Suporte Técnico ]](./1-suporte-tecnico.md)