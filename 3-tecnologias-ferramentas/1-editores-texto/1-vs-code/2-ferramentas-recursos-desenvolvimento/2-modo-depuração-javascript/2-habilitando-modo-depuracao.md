# Habilitando o Modo Depuração

Para habilitar o modo de depuração no VS Code para JavaScript, siga estes passos:

### 1. Abra o VS Code e o arquivo JavaScript que você deseja depurar

### 2. Instale a extensão Node.js

Caso esteja trabalhando com código JavaScript no Node.js, certifique-se de ter a extensão "Debugger for JavaScript" (inclusa por padrão no VS Code) ou uma extensão para Node.js instalada.

### 3. Configuração de lançamento (Launch Configuration)

- Abra o menu de depuração clicando no ícone de depuração na barra lateral esquerda ou pressione `Ctrl + Shift + D` (Windows/Linux) ou `Cmd + Shift + D` (Mac)
- Clique em "Criar um arquivo [launch.json](../../1-configuracoes-ambiente/4-launch-json.md)" se o VS Code sugerir essa opção
- Escolha o ambiente Node.js para configurar o arquivo **launch.json** com as configurações padrão para depuração Node.js


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

### 4. Define breakpoints

No seu código, clique à esquerda da linha onde deseja interromper a execução para adicionar um breakpoint (ponto de interrupção).

### 5. Inicie a depuração

- Com o arquivo **launch.json** configurado, clique no botão "Iniciar Depuração" (ícone play na barra lateral de depuração) ou pressione `F5`
- O VS Code iniciará a depuração, parando nos breakpoints que você definiu

### 6. Inspecione variáveis e pilha de chamadas

Durante a depuração, você poderá inspecionar variáveis (passando o mouse sobre elas), examinar a pilha de chamadas e controlar o fluxo do código usando os botões de controle (passo a passo, continuar, parar, etc.).

# [[ Voltar para: Modo Depuração (JavaScript) ]](./1-modo-depuração-javascript.md)