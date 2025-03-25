# npx

O npx é uma ferramenta que vem junto com o Node.js (inclusa no npm CLI a partir da versão 5.2) e facilita a execução de comandos de pacotes sem precisar instalá-los globalmente ou adicionar manualmente o caminho completo.

### Sumário

- [Para que Serve o npx?](#npx)
- [Instalação Temporária com npx](#instalação-temporaria)

# <a id="npx">Para que Serve o npx?</a>

### 1. Executar pacotes sem instalação global

Com npx, você pode executar um pacote diretamente sem precisar instalá-lo globalmente, ideal para ferramentas que você só precisa executar ocasionalmente.

```Bash
$ npx A< nome do pacote >
```

Por exemplo, para rodar o ESLint apenas uma vez, você pode usar:

```Bash
$ npx eslint file.js
```

### 2. Executar a versão local de um pacote

Se você tiver uma versão específica de uma ferramenta instalada localmente (no diretório **node_modules**), o npx usará essa versão por padrão, garantindo que você está sempre rodando a versão específica do projeto.

### 3. Simplificar a execução de pacotes

Em vez de navegar até **node_modules/.bin** para rodar ferramentas locais, você pode usar npx para simplificar o comando.

## Exemplos

### 1. Exemplo com npx

```Bash
$ npx mocha
```

O npx localiza o pacote e o executa, facilitando o uso de ferramentas sem poluir o ambiente global.

# <a id="instalação-temporaria">Instalação Temporária com npx</a>

Se você usar npx para executar um pacote que ainda não está instalado, ele faz o download temporário e o executa, sem adicioná-lo permanentemente ao seu projeto ou ao ambiente global.

## Como Funciona a Instalação Temporária com npx?

### 1. Instalação temporária

Se o pacote não estiver disponível local ou globalmente, npx faz o download temporário durante a execução. O pacote será removido do cache assim que o comando terminar.

### 2. Instalação com cache

O npx armazena temporariamente pacotes no cache do npm, evitando o download repetido de pacotes de uso único. Porém, pacotes baixados com npx não ficam permanentemente instalados em **node_modules** e precisam ser baixados novamente se você quiser utilizá-los futuramente e eles não estiverem instalados localmente.

## Exemplos

### 1. Exemplo de instalação temporária

Para rodar o pacote `create-react-app` sem instalá-lo permanentemente:

```Bash
$ npx create-react-app my-app
```

Aqui, o npx baixará o `create-react-app` se ele ainda não estiver instalado, executará o comando, e em seguida, removerá o pacote do cache. Isso é útil para rodar pacotes pontualmente, especialmente ferramentas CLI (Command-Line Interface).

# [[ Voltar para: Ferramentas ]](./1-ferramentas.md)