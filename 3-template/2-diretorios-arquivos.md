# Diretórios e Arquivos

# Nomes

- **Numeração para organização:** use numeração sequencial (ex: **1-introducao**) apenas se a ordem dos arquivos for essencial
- **Letras minúsculas e separadores:** utilize letras minúsculas e o caractere hífen (`-`) como separador. Não utilize espaços e caracteres especiais para facilitar a portabilidade
- **Sem acentos:** não utilize acentuação nos nomes para manter a compatibilidade com diferentes sistemas

## Métodos/Funções e Propriedades de Objetos

- **Nomeação direta:** nomeie o arquivo apenas com o nome do método/função ou propriedade
- **Encadeamento:** em casos de encadeamento, inclua todas as propriedades no nome do arquivo, separando-as com o caractere underline (`_`), ex:  
    **objeto_propriedade_subpropriedade.md**

# Exemplos

### Nomes

- **1-setup**
- **2-config**
- **3-dados-importantes**
- **1-carregarDados.md**
- **2-objeto_propriedade_subpropriedade_metodo.md**

### Representação do sistema hierárquico de arquivos

Formato de árvore expandida (tree). Este formato é ótimo para um visão hierárquica em profundidade, onde cada nível fica claramente separado.

```Bash
my-project/
└── src/
    ├── custom-tests/
    │   └── services/
    |       └── getAccessToken.test.js
    ├── services/
    │   └── sensitive-data-getters.js
    ├── index.js
    └── package.json
```

# [[Próximo tópico: Títulos]](./3-titulos.md)