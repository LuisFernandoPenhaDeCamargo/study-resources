# Debug Console

O Debug Console é uma ferramenta dentro do VS Code usada para:

### 1. Avaliação de expressões e variáveis

- Durante uma sessão de depuração, você pode digitar comandos e expressões no console para ver o valor atual de variáveis, resultados de cálculos ou até chamar funções diretamente
- Você pode alterar o valor de variáveis diretamente no console para testar outros casos sem ter que modificar o código
- Isso é útil para verificar se as variáveis estão com os valores esperados ou para entender como o código se comporta em diferentes cenários

### 2. Execução de comandos em tempo real

Você pode rodar expressões JavaScript ou comandos diretamente no Debug Console para testar pequenos trechos de código sem modificar o arquivo

### 3. Exibição de saídas e logs

- Qualquer saída nos métodos JavaScript como `console.log`, `console.error`, ou similares é exibida aqui, permitindo que você veja as mensagens de log enquanto o código é executado
- Durante a depuração, o Debug Console também exibe mensagens de erros, exceções e logs, ajudando a identificar pontos problemáticos no código

## Sumário

- [Não Aparecimento dos Consoles](#nao-aparecimento-consoles)
- [`Please start a debug session to evaluate expressions`](#please-start-debug-session-evaluate-expressions)

# <a id="nao-aparecimento-consoles">Não Aparecimento dos Consoles</a>

Se os consoles (como o Debug Console, Terminal, e Output) não estão aparecendo automaticamente ao iniciar a depuração com `F5`, você pode forçá-los a aparecer manualmente ou ajustar as configurações para que eles sejam exibidos automaticamente. Aqui estão algumas opções:

### 1. Mostrar o Debug Console manualmente

- **Atalho do teclado:** pressione `Ctrl + Shift + Y` (Windows/Linux) ou `Cmd + Shift + Y` (Mac) para abrir o Debug Console
- **Painel de exibição:** você também pode clicar na guia "Debug Console" na barra inferior do VS Code

### 2. Configurar para abrir automaticamente

- Abra o arquivo de configuração [**launch.json**](../../1-configuracoes-ambiente/4-launch-json.md) (criado automaticamente na pasta **.vscode** do projeto quando você configura a depuração)
- Dentro da configuração da sua sessão de depuração, adicione ou ajuste a propriedade `internalConsoleOptions` para `openOnSessionStart`. Isso fará com que o Debug Console abra automaticamente ao iniciar a depuração

O código no **launch.json** ficará assim:

```JSON
{
    "version": "0.2.0",
    "configuration": [
        {
            "type": "node",
            "request": "launch",
            "name": "Launch Program",
            "program": "${workspaceFolder}/app.js", // ou o caminho para o seu arquivo principal.
            "internalConsoleOptions": "openOnSessionStart"
        }
    ]
}
```

### 3. Verificar as configurações do VS Code

Em alguns casos, o VS Code pode estar configurado para não abrir o Debug Console automaticamente. Para ajustar isso, vá até Configurações (`Ctrl + ,` ou `Cmd +`, no Mac), pesquise por "Debug Console" e verifique se as opções de exibição estão de acordo com o que você deseja.

# <a id="please-start-debug-session-evaluate-expressions">`Please start a debug session to evaluate expressions`</a>

A mensagem indica que o Debug Console está aguardando o início de uma sessão de depuração para avaliar ou executar expressões do seu código. Em outras palavras, você precisa estar em uma sessão ativa de depuração para que o console possa executar e avaliar comandos e variáveis em tempo real.

# [[ Voltar para: Modo Depuração (JavaScript) ]](./1-modo-depuração-javascript.md)