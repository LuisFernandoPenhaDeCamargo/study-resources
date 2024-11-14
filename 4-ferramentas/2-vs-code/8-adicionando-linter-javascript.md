# Adicionando um Linter (JavaScript)

Para adicionar um linter JavaScript ao VS Code, uma boa prática é integrar ESLint, que ajuda a identificar e corrigir erros de estilo e possíveis problemas no código. Abaixo estão as etapas para configurar o ESLint, juntamente com uma breve explicação sobre a importância e o uso do linter no VS Code.

# Adicionando um Linter

A integração de um linter no VS Code permite verificar automaticamente o estilo e a qualidade do código, ajudando a identificar erros e promover um código mais consistente. O ESLint é uma das ferramentas mais utilizadas para JavaScript.

## Passos para Configuração

### 1. Instale o ESLint como dependência de desenvolvimento

No terminal do projeto, execute:

```Bash
$ npm install eslint --save-dev
```

### 2. Inicie o ESLint

Gere um arquivo de configuração **.eslintrc** que define as regras e estilos do projeto. Execute:

```Bash
$ npx eslint --init
```

Siga as instruções para definir as configurações desejadas, como o ambiente do projeto (Node.js, navegador, etc.) e o estilo do código (ex: Airbnb, Google, etc.).

### 3. Instale a extensão ESLint no VS Code

Abra a aba de Extensões no VS Code (ou pressione `Ctrl + Shift + X`), pesquise por ESLint e instale a extensão oficial.

### 4. Configure o settings.json do VS Code

No **settings.json** do VS Code (localizado em **.vscode/settings.json**), adicione as seguintes configurações para garantir que o ESLint seja executado automaticamente ao salvar:

```JSON
{
    "editor.codeActionOnSave": {
        "source.fixAll.eslint": true
    },
    "eslint.validate": [
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact"
    ]
}
```

- `editor.codeActionOnSave`**:** permite que o ESLint tente corrigir automaticamente problemas detectados ao salvar o arquivo
- `eslint.validate`**:** especifica os tipos de arquivos para os quais o ESLint deve ser aplicado

### 5. Execute o linter manualmente

Para verificar todos os arquivos do projeto, execute no terminal:

```Bash
$ npx eslint . --ext .js, .jsx, .ts, .tsx
```

# Vantagens

1. **Consistência no código:** ajuda a garantir um estilo uniforme, especialmente em equipes de desenvolvimento
2. **Identificação de erros:** detecta rapidamente erros de sintaxe e problemas potenciais de lógica
3. **Correção automática:** o ESLint pode corrigir automaticamente pequenos problemas, economizando tempo
4. **Qualidade de código:** auxilia na adoção de boas práticas, aumentando a legibilidade e a confiabilidade do código

# Porque Instalar uma Dependência se Vamos Utilizar uma Extensão?

A instalação do ESLint como uma dependência no projeto e o uso da extensão no VS Code cumprem funções complementares, e cada uma traz benefícios distintos:

## 1. Dependência Local (`eslint` como Dependência de Desenvolvimento)

- **Consistência do projeto:** ter o ESLint como uma dependência no **package.json** garante que **todos os membros da equipe** utilizem a mesma versão e as mesmas regras do linter. Isso é essencial em ambientes colaborativos, já que diferentes versões ou configurações podem levar a estilos de código inconsistentes
- **Execução em CI/CD:** no pipeline CI/CD, a execução do linter depende das dependências do projeto. Ter o ESLint como dependência permite que o código seja verificado automaticamente em um ambiente de integração contínua antes de ser aprovado para produção
- **Execução via scripts:** como ESLint instalado no projeto, você pode criar scripts no **package.json** para rodá-lo manualmente ou automaticamente, usando comandos como `npm run lint`

## 2. Extensão do ESLint no VS Code

- **Feedback em tempo real:** a extensão permite que o VS Code mostre erros e avisos imediatamente enquanto você digita o código, ajudando a corrigir problemas antes mesmo de salvar
- **Correção automática ao salvar:** a extensão pode aplicar correções automáticas ao salvar, como ajustar a formatação e corrigir pequenas inconsistências de estilo com base nas configurações definidas
- **Integração de editor:** a extensão melhora a experiência de desenvolvimento, mostrando diretamente no editor onde estão os erros de lint, sem a necessidade de rodar comandos no terminal

## Resumo

Instalar o ESLint como dependência garante a consistência de integração do linter em vários ambientes. A extensão no VS Code, por outro lado, é uma ferramenta conveniente para obter feedback imediato enquanto você trabalha. Juntas, essas duas abordagens maximizam a eficiência e a qualidade do código.

# [[ Voltar para: Visual Studio Code ]](./1-vs-code.md)