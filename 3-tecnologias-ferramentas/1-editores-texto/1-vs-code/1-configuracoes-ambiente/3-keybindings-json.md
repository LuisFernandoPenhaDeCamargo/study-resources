# keybindings.json

O arquivo **keybindings.json** no VS Code é onde você pode personalizar atalhos de teclado, criando ou ajustando combinações para comandos específicos. Esse arquivo é especialmente útil para adaptar o ambiente de desenvolvimento às suas preferências, permitindo substituir atalhos padrões ou criar novos.

# Como Acessar o keybindings.json

Você pode abrir o arquivo **keybindings.json** de duas maneiras principais:

### 1. Via Paleta de Comandos

- Pressione `Ctrl + Shift + P` para abrir a Paleta de Comandos
- Digite: "Preferences: Open Keyboard Shortcuts (JSON)" e pressione `Enter`

### 2. Via Página de Atalhos

- Pressione `Ctrl + K`, depois `Ctrl + S` para abrir a página gráfica de atalhos do VS Code
- No conta superior direito, clique no ícone do documento para abrir o **keybindings.json** diretamente

# Estrutura e Sintaxe

No **keybindings.json**, os atalhos são definidos em formato de lista, onde cada entrada segue a estrutura básica:

```JSON
{
    "key": "ctrl+k ctrl+c",
    "command": "editor.action.commentLine",
    "when": "editorTextFocus"
}
```

- `key`**:** define a combinação de teclas
- `command`**:** identifica o comando a ser executado
- `when`**:** especifica as condições para ativar o atalho, tornado-o contexto-sensitivo

O **keybindings.json** permite um alto nível de personalização e pode ser facilmente ajustado para melhorar sua produtividade no VS Code.

# [[ Voltar para: Configurações de Ambiente ]](./1-configuracoes-ambiente.md)