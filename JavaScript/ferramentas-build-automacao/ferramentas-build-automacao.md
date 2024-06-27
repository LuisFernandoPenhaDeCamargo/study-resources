# Ferramentas de Build e Automação

### Sumário

- [Webpack](#webpack)
- Babel
- ESLint
- Prettier

# <a id="webpack">Webpack</a>

Webpack é uma ferramenta de build e automação extremamente popular no ecossistema JavaScript. Sua principal função é empacotar módulos JavaScript, junto com suas dependências, em um ou mais arquivos de saída, chamados de "bundles". Isso facilita a gestão e a distribuição de código em aplicações web modernas.

## Principais Características

### 1. Modularização

- Webpack permite trabalhar com módulos, facilitando a organização do código em partes menores e reutilizáveis
- Suporta a importação de diversos tipos de arquivos como JavaScript, CSS, imagens, fontes, etc., através de loaders

### 2. Loaders

- Loaders transformam arquivos de outros tipos em módulos válidos que podem ser incluídos no bundle JavaScript
- **Exemplo:** `babel-loader` para transpilar código ES6+ para ES5, `css-loader` para importar arquivos CSS, `file-loader` para importar imagens e fontes

### 3. Plugins

- Plugins são usados para realizar uma ampla variedade de tarefas que o Webpack não pode realizar sozinho
- **Exemplo:** `HtmlWepackPlugin` para gerar arquivos HTML que incluem automaticamente os bundles, `MiniCssExtractPlugin` para extrair CSS em arquivos separados

### 4. Code Splitting

- Divide o código em pedaços menores (chunks) que podem ser carregados sob demanda
- Melhora a performance ao carregar apenas o código necessário inicialmente e o restante conforme necessário

### 5. DevServer

- Webpack DevServer fornece um servidor de desenvolvimento com live reloading
- Facilita o desenvolvimento e a depuração de aplicações, atualizando automaticamente o navegador quando o código fonte é alterado

### 6. Tree Shaking

- Remove o código JavaScript que não está sendo utilizado (dead code) na aplicação
- Reduz o tamanho do bundle final, melhorando o desempenho

### 7. Hot Module Replacement (HMR)

- Permite atualizar módulos no navegador em tempo real sem recarregar a página inteira
- Acelera o processo de desenvolvimento, mantendo o estado da aplicação enquanto faz atualizações

## Exemplos

Um exemplo básico de configuração de um arquivo webpack.config.js para uma aplicação JavaScript simples:

```JavaScript
const path = require("path");
const HtmlWebpackPlugins = require("html-webpack-plugin");

module.exports = {
    entry: "./src/index.js", // Ponto de entrada principal da aplicação.
    output: {
        filename: "bundle.js", // Nome do arquivo de saída.
        path: path.resolve(__dirname, "dist"), // Diretório de saída.
        clean: true, // Limpa a pasta de saída antes de cada build.
    },
    module: {
        rules: [
            {
                test: /\.js$/, // Aplica babel-loader a todos os arquivos .js.
                exclude: /node_modules/,
                    use: {
                        loader: "babel-loader",
                    },
            },
            {
                test: /\.css$/, // Aplica style-loader e css-loader a todos os arquivos .css.
                use: ["style-loader", "css-loader"],
            },
            {
                teste: /\.(png|svg|jpg|jpeg|gif)$/, // Aplica file-loader a todos os arquivos de imagem.
                type: "asset/resource",
            },
        ],
    },
    plugins: [
        new HtmlWebpackPlugin({
            template: "./src/index.html", // Gera um arquivo HTML baseando-se no template especificado.
        }),
    ],
    devServer: {
        contentBase: "./dist", // Servidor de desenvolvimento servirá arquivos desta pasta.
    },
    mode: "development", // Define o modo de desenvolvimento (para produção, use "production").
}
```

## Conclusão

O Webpack é uma ferramenta poderosa e flexível que se tornou uma parte essencial do desenvolvimento moderno de aplicações JavaScript. Ele oferece uma ampla gama de funcionalidades que ajudam a gerenciar e otimizar o código, desde o desenvolvimento até a produção. Estudar e dominar o Webpack pode melhorar significativamente a eficiência e a performance das suas aplicações web.