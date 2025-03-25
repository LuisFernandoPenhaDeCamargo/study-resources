# Responsabilidade das Aplicações

# Ventura

"Da forma que eu entendo, mas não sou especialista em nada disso:

- **Game-API (zoe-game-api):** responsável pelas interações com o Game e com o Caixa
- **Data-API (orion-data-api):** responsável pelas exportações e interações do Cloud com o Servidor
- **Zoe-updater (zoe-updater):** responsável pelo gerenciamento dos arquivos do jogo, garantia de atualização recorrente e auxílio no processo de download de inicialização
- **Updater (updater):** responsável pelo gerenciamento dos repositórios do Gravador
    + **/conteudo/zoe-client-src**
    + **/conteudo/zoe-server-tools**
    + **/conteudo/stand**

Em destaque o **/conteudo/zoe-client-src** que precisa de um gerenciamento específico para a pasta **game-set**. Existem vários aspectos do Gravador ainda não considerados, como o **zoe-cyber-src**, os jogos de Bingo, as gráficas padrão delta, a utilização de idioma global, entre outros."

# [[ Voltar para: Orion Games ]](./orion-games.md)