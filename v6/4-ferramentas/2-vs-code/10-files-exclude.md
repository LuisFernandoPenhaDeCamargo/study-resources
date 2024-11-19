# "files to exclude"

A opção "files to exclude" no VS Code permite que você oculte arquivos e pastas específicos do explorador de arquivos, da pesquisa e de outras funcionalidades do editor. Isso é útil para ignorar arquivos que não precisam ser visualizados com frequência, como diretórios de dependências (**node_modules**) ou arquivos de build.

# Como Configurar

### 1. Acessando as configurações

- Abra as configurações do VS Code pressionando `Ctrl + ,` (Windows/Linux) ou `Cmd + ,` (Mac)
- Na barra de pesquisa de configurações, digite "Preferences: Open User Settings (JSON)"

### 2. Configurando arquivos e pastas para excluir

- Na chave `files.exclude`, adicione padrões globais para os arquivos ou pastas que você quer ocultar

```JSON
{
    "**/node_modules": true,
    "**/.git": true,
    "**/dist": true
}
```

- Cada entrada no objeto segue um padrão glob, onde `**` significa "qualquer pasta" e o valor `true` indica que o item deve ser excluído

### 3. Exclusão específica para pesquisa

Para excluir arquivos somente da pesquisa (sem ocultá-los no explorador), use a configuração `search.exclude`.

# Exemplos

### 1. Exemplo de configuração completa em settings.json

```JSON
{
    "files.exclude": {
        "**/node_modules": true,
        "**/.git": true,
        "**/dist": true
    },
    "search.exclude": {
        "**/node_modules": true,
        "**/dist": true
    }
}
```

Essa configuração ajuda a manter o explorador de arquivos e a ferramenta de busca organizados, ocultando arquivos desnecessários e aumentando a eficiência do desenvolvimento.

# [[ Voltar para: Visual Studio Code ]](./1-vs-code.md)