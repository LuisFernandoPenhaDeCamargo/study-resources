# Diretórios e Arquivos

Este guia apresenta diretrizes para nomear e citar diretórios e arquivos, além de regras para representar visualmente a estrutura hierárquica.

# Nomeação de Diretórios e Arquivos

Diretrizes específicas para nomear diretórios e arquivos, garantindo consistência e portabilidade entre diferentes sistemas de arquivos.

## Regras Gerais de Nomeação

- **Numeração para organização:** utilize numeração sequencial (ex: **1-introducao.md**) apenas se a ordem dos arquivos for necessária
- **Letras minúsculas e separadores:** os nomes devem ser em letras minúsculas, com hífens (-) como separadores. Evite espaços e caracteres especiais para facilitar o uso em múltiplos sistemas
- **Sem acentos:** evite acentuação para manter a compatibilidade entre diferentes sistemas
- **Correspondência ao nome do tópico:** o nome do diretório ou arquivo deve corresponder ao nome do tópico principal, omitindo preposições e artigos

## Diretrizes Específicas

1. **Caracteres permitidos:** utilize letras (minúsculas), números, hífen, sublinhado e ponto
2. **Não utilize caracteres especiais:** não utilize caracteres com significado especial no shell, como `@`, `$`, `%`, entre outros, para evitar comportamentos inesperados
3. **Comprimento do nome:** embora o limite geral seja 255 caracteres, opte por nomes concisos e fáceis de manipular
4. **Sensibilidade a maiúsculas e minúsculas:** em sistemas Unix e Linux, letras maiúsculas e minúsculas diferenciam nomes de arquivos e diretórios
5. **Uso de pontos:** use um único ponto para separar o nome do arquivo de sua extensão. Múltiplos pontos podem causar intepretações incorretas pelo sistema
6. **Extensões de arquivos:** utilize extensões apropriadas para cada tipo de arquivo, como **.txt**, **.js**, **.pdf**, **.sh**, etc. Separe a extensão do nome principal com um ponto

### Nomeação de métodos/funções e propriedades de objetos

- **Nomeação direta:** nomeie o arquivo apenas com o nome do método, função ou propriedade
- **Encadeamento:** em casos de encadeamento, inclua todas as propriedades no nome do arquivo, separando-as com o caractere underline (_). Exemplo: **objeto_propriedade_subpropriedade.md**

# Citação de Diretórios e Arquivos

Regras para quando os diretórios e arquivos são citados.

## Caminhos Absolutos e Relativos

Ao citar um diretório ou arquivo em um texto, é essencial especificar se o caminho é absoluto ou relativo para que o leitor saiba exatamente como localizar o recurso mencionado.

- **Caminho absoluto:** inicia a partir da raiz do sistema ou repositório, oferecendo uma localização fixa, independente de onde o arquivo atual esteja localizado. Exemplo: **/projeto-principal/src/utils/funcoes.js**
- **Caminho relativo:** define o caminho a partir da localização do arquivo que o cita. Esse tipo de caminho é útil para navegação dentro da estrutura do projeto e geralmente é indicado para manter a portabilidade entre sistemas de arquivos diferentes. Exemplo **../utils/funcoes.js**

# Representação do Sistema Hierárquico de Arquivos

Utilize o formato de árvore expandida (comando `tree`) para representar a estrutura de diretórios e arquivos do projeto. Este formato oferece uma visualização hierárquica detalhada, onde cada nível é claramente separado, facilitando a leitura e compreensão da organização do projeto.

Exemplo de estrutura em formato de árvore:

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

Notas sobre a estrutura de árvore.

- Cada diretório é indicado com um nível de indentação adicional, representando sua posição na hierarquia
- Arquivos e diretórios são listados em ordem alfabética para facilitar a busca visual
- Para criar uma árvore, você pode usar o comando `tree` no terminal Unix, que gera automaticamente a estrutura hierárquica dos diretórios e arquivos

# [[ Voltar para: Template ]](./1-template.md)