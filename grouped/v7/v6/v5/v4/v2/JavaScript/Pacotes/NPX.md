# <a id="npx"></a>NPX

É um package runner (um executor de pacotes), ele executa as bibliotecas que podem ser baixadas do npmjs. Essas bibliotecas ficam em um banco de dados chamado NPM Registry, elas também podem ser baixadas via CLI com o NPM.

O NPX busca a biblioteca na Registry do NPM, instala em uma pasta temporária, executa o comando e depois remove a biblioteca da máquina, ela não fica na **node_modules** global.

NPX não só busca no site do npmjs, como busca de dentro da **node_modules** do projeto ou até mesmo na **node_modules** global antes de ir na internet buscar a lib e executar.

Por exemplo, se você quiser executar um script contido no pacote `foo`, você pode simplesmente usar:

```bash
$ npx foo
```

Se o pacote `foo` estiver instalado localmente em seu projeto, o `npx` usará essa versão, se não, irá procurar pela versão global. Por fim, ele será temporariamente baixado e depois removido, isso permite que você execute facilmente scripts de pacotes sem a necessidade de instalá-los.