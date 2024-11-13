# Modo Depuração (JavaScript)

### Sumário

- [Habilitando o Modo Depuração](#habilitando-modo-depuracao)
- [Depuração no Navegador (para Aplicações Web)](#depuracao-navegador)
- [Controles de Depuração](#controles-depuracao)
- [Debug Console](#debug-console)

# <a id="habilitando-modo-depuracao">Habilitando o Modo Depuração</a>

Para habilitar o modo de depuração no VS Code para JavaScript, siga estes passos:

### 1. Abra o VS Code e o arquivo JavaScript que você deseja depurar

### 2. Instale a extensão Node.js

Caso esteja trabalhando com código JavaScript no Node.js, certifique-se de ter a extensão "Debugger for JavaScript" (inclusa por padrão no VS Code) ou uma extensão para Node.js instalada.

### 3. Configuração de lançamento (Launch Configuration)

- Abra o menu de depuração clicando no ícone de depuração na barra lateral esquerda ou pressione `Ctrl + Shift + D` (Windows/Linux) ou `Cmd + Shift + D` (Mac)
- Clique em "Criar um arquivo launch.json" se o VS Code sugerir essa opção
- Escolha o ambiente Node.js para configurar o arquivo **launch.json** com as configurações padrão para depuração em Node.js

O arquivo **launch.json** será criado na pasta **.vscode** do seu projeto com uma configuração inicial, como esta:

```JSON
{
    "version": "0.2.0",
    "configuration": [
        {
            "type": "node",
            "request": "launch",
            "name": "Launch Program",
            "skipFiles": ["<node_internals/**>"],
            "program": "${workspaceFolder}/app.js" // Substitua "app.js" pelo seu arquivo principal (entry point).
        }
    ]
}
```

### 4. Defina breakpoints

No seu código, clique à esquerda da linha onde deseja interromper a execução para adicionar um breakpoint (ponto de interrupção).

### 5. Inicie a depuração

- Com o arquivo **launch.json** configurado, clique no botão "Iniciar Depuração" (ícone play na barra lateral de depuração) ou pressione `F5`
- O VS Code iniciará a depuração, parando nos breakpoints que você definiu

### 6. Inspecione variáveis e pilha de chamadas

Durante a depuração, você poderá inspecionar variáveis (passando o mouse sobre elas), examinar a pilha de chamadas e controlar o fluxo do código usando os botões de controle (passo a passo, continuar, parar, etc.).

# <a id="depuracao-navegador">Depuração no Navegador (para Aplicações Web)</a>

Se você está depurando JavaScript em aplicações web, precisará usar a extensão "Debugger for Chrome" ou "Debugger for Edge". Após instalá-la, crie uma configuração de lançamento específica para o navegador no **launch.json** com `"type": "pwa-chrome"` para o Chrome, por exemplo.

# <a id="controles-depuracao">Controles de Depuração</a>

### 1. Iniciar a Depuração

Certifique-se de que você está em uma sessão de depuração ativa (pressione `F5` para iniciar, caso ainda não tenha começado).

### 2. Avançar para o próximo breakpoint

Pressione `F5` novamente ou clique no botão "Continuar" (ícone de play) no painel de depuração. Isso fará com que o programa continue a execução até o próximo breakpoint.

### 3. Outros comandos úteis

- **Step Over (**`F10`**):** executa a próxima linha de código, mas ignora as funções chamadas nessa linha. Útil para avançar a linha sem entrar em funções
- **Step In (**`F11`**):** entra em uma função chamada na linha atual, permitindo inspecionar o que acontece dentro dela
- **Step Out (**`Shift + F11`**):** sai da função atual e volta para o ponto em que ela foi chamada

# <a id="debug-console">Debug Console</a>

O Debug Console é uma ferramenta dentro do VS Code usada para:

### 1. Avaliação de expressões e variáveis

- Durante uma sessão de depuração, você pode digitar comandos e expressões no console para ver o valor atual de variáveis, resultados de cálculos ou até chamar funções diretamente
- Você pode alterar o valor de variáveis diretamente no console para testar outros casos sem ter que modificar o código
- Isso é útil para verificar se as variáveis estão com os valores esperados ou para entender como o código se comporta em diferentes cenários

### 2. Execução de comandos em tempo real

Você pode rodar expressões JavaScript ou comandos diretamente no Debug Console para testar pequenos trechos de código sem modificar o arquivo.

### 3. Exibição de saídas e logs

- Qualquer saída no `console.log`, `console.error`, ou similar é exibida aqui, permitindo que você veja as mensagens de log enquanto o código é executado
- Durante a depuração, o Debug Console também exibe mensagens de erros, exceções e logs, ajudando a identificar pontos problemáticos no código

## Não Aparecimento dos Consoles

Se os consoles (como o Debug Console, Terminal, e Output) não estão aparecendo automaticamente ao iniciar a depuração com `F5`, você pode forçá-los a aparecer manualmente ou ajustar as configurações para que eles sejam exibidos automaticamente. Aqui estão algumas opções:

### 1. Mostrar o Debug Console manualmente

- **Atalho do teclado:** pressione `Ctrl + Shift + Y` (Windows/Linux) ou `Cmd + Shift + Y` (Mac) para abrir o Debug Console
- **Painel de exibição:** você também pode clicar na guia "Debug Console" na barra inferior do VS Code

### 2. Configurar para abrir automaticamente

- Abra o arquivo de configuração **launch.json** (criado automaticamente na pasta **.vscode** do projeto quando você configura a depuração)
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

Em alguns casos, o VS Code pode estar configurado para não abrir o Debug Console automaticamente. Para ajustar isso, vá até Configurações (`Ctrl +`, ou `Cmd +`, no Mac), pesquise por "Debug Console" e verifique se as opções de exibição estão de acordo com o que você deseja.

## `Please start a debug session to evaluate expressions`

A mensagem indica que o Debug Console está aguardando o início de uma sessão de depuração para avaliar ou executar expressões do seu código. Em outras palavras, você precisa estar em uma sessão ativa de depuração para que o console possa executar e avaliar comandos e variáveis em tempo real.

# [[ Voltar para: Visual Studio Code ]](./1-vs-code.md)