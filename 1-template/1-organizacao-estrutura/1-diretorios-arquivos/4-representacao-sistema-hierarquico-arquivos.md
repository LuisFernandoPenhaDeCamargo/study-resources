# Representação do Sistema Hierárquico de Arquivos

Este documento apresenta diretrizes para a representação da estrutura hierárquica de arquivos e diretórios, utilizando o formato de árvore expandida. O objetivo é oferecer uma visualização clara e detalhada, com níveis claramente separados, facilitando a leitura e compreensão da organização do sistema.

# Exemplos

Exemplo de estrutura em formato de árvore.

```Bash
my-project/
└── src/
    ├── custom-tests/
    │   └── services/
    │       └── getaccesstoken.test.js
    ├── services/
    │   └── sensitive-data-getters.js
    ├── index.js
    └── package.json
```

Notas sobre a estrutura de árvore.

- Cada diretório é indicado com um nível de indentação adicional, representando sua posição na hierarquia
- Arquivos e diretórios são listados em ordem alfabética para facilitar a busca visual
- Para criar uma árvore, você pode usar o comando `tree` no terminal Unix, que gera automaticamente a estrutura hierárquica dos diretórios e arquivos

# [[ Voltar para: Diretórios e Arquivos ]](./1-diretorios-arquivos.md)