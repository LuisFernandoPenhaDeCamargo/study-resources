# <a id="node-gyp"></a>`node-gyp`

O `node-gyp` é uma ferramenta de compilação que simplifica a compilação de módulos nativos escritos em C++ para serem executados em Node.js. Ele permite que você compile códigos C++ que são necessários para alguns pacotes npm que dependem de módulos nativos.

Aqui estão algumas das principais funções do `node-gpy`:

1. **Compilação de módulos nativos:** ele permite a compilação de códigos C++ para criar binários que podem ser carregados pelo Node.js
2. **Gestão de dependências:** o `node-gyp` lida automaticamente com muitos detalhes relacionados ao sistema operacional e ao ambiente de compilação, tornando mais fácil compilar módulos nativos em diferentes plataformas
3. **Integração com o npm:** o `node-gyp` é frequentemente usado em conjunto com o npm para instalar pacotes npm que incluem módulos nativos. **Quando você instala um pacote npm que requer compilação, o** `node-gyp` **é chamado automaticamente para compilar os módulos necessários**
4. **Suporte a plataformas diversas:** o `node-gyp` é compatível com uma variedade de plataformas, incluindo Linux, macOS e Windows

Se você estiver trabalhando com pacotes npm que incluem módulos nativos ou se precisar compilar módulos nativos para o Node.js, é provável que você precide do `node-gyp` instalado em sua máquina.