# Ngrok.

Permite viabilizar um servidor local para a nuvem. No caso da Orion Games, eu disponibilizei meu servidor local para a nuvem para ele ser acessado por um stand.

**O Ngrok é uma ferramenta que permite expor um servidor local para a internet**, tornando-o acessível remotamente por meio de um túnel seguro. Ele útil para testar aplicativos da web, criar demonstrações de projetos, depurar e compartilhar seu trabalho com outras pessoas sem a necessidade de implantar o aplicativo em um servidor público.

### <a name = "execucaotunel"></a>Execução do túnel.

Abra um terminal e execute o comando `ngrok` seguro pelo número da pota local que deseja expor para a internet. Por exemplo, se você estiver executando um servidor web local na porta 80, você pode usar o seguinte comando:

`ngrok http 80`

O Ngrok gerará um URL público, como `https://abcd1234.ngrok.io`, que pode ser usado para acessar o seu servidor local a partir de qualquer lugar.

### Acesso remoto.

Com o URL público gerado pelo Ngrok, você pode compartilhá-lo com outras pessoas para que elas possam acessar seu servidor local. Lembre-se de que, se você estiver executando um servidor local com recursos sensíveis, é importante tomar medidas para proteger o acesso, como configurar autenticação e autorização.

### Monitoramento e gerenciamento.

Se você tiver uma conta Ngrok registrada, poderá acessar o painel de controle do Ngrok para monitorar as estatísticas e gerenciar os túneis que você criou.

### Problemas de compatibilidade com o Node.js.

No geral, o Ngrok em si não é afetado pela versão do Node.js, mas a compatibilidade de outros pacotes em seu projeto Node.js pode depender da versão do Node.js que você está usando. Portanto, certifique-se de manter a compatibilidade com todas as dependências de seu projeto.

**Observando ainda que se você o instalou em uma versão do Node.js, ele não será listado em outra, nem mesmo no terminal**. Exemplo:\
Digamos que você está utilizando a versão v8.16.0 do Node.js, mas você o instalou na versão v14.21.3, se você utilizar o comando `ngrok -v` na versão v8.16.0 a mensagem "Comando 'ngrok' não encontrado" irá aparecer. Se você mudar para a versão v14.21.3 e utilizar o mesmo comando, a versão do Ngrok aparecerá.