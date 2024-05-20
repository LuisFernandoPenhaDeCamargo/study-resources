# <a id="nexe"></a>Nexe

### Sumário

- [`pkg` x Nexe](#"pkg-x-nexe")
- [Segurança](#seguranca)
- [Compilando o seu Código-fonte com o Nexe](#compilando-codigo-fonte-nexe)
    + [Especificação de Target](#compilando-codigo-fonte-nexe-especificacao-target)
    + [Observações Importantes](#compilando-codigo-fonte-nexe-observacoes-importantes)
        - [Configurações de Compilação Ideais](#compilando-codigo-fonte-nexe-observacoes-importantes-configuracoes-compilacao-ideais)
        - [Recursos Não Sendo Incluídos no Compilado](#compilando-codigo-fonte-nexe-observacoes-importantes-recursos-nao-incluidos-compilado)
        - [Problemas ao Tentar Comprimir o Compilado](#compilando-codigo-fonte-nexe-observacoes-importantes-problemas-tentar-comprimir-compilado)
        - [Problemas de Segurança](#compilando-codigo-fonte-nexe-observacoes-importantes-problemas-seguranca)
        - [Problemas de Depêndencias Externas](#compilando-codigo-fonte-nexe-observacoes-importantes-problemas-dependencias-externas)
        - [Problemas com o PM2](#compilando-codigo-fonte-nexe-observacoes-importantes-problemas-pm2)

# <a id="pkg-x-nexe"></a>`pkg` x Nexe

Ambos o `pkg` e o `nexe` têm seus próprios prós e contras, e a escolha entre eles depende das necessidades específicas do seu projeto e das características que são mais importantes para você. Abaixo segue algumas considerações para ajudar a avaliar o custo-benefício de cada um:

`pkg`

**Prós**

- Fácil de usar e configurar

**Contras**

- Pode ser necessário lidar com problemas de compatibilidade ao empacotar certos tipos de dependências
- A compilação pode ser mais lenta, especialmente para grandes projetos

`nexe`

**Prós**

- Menor sobrecarga de tamanho de arquivo em comparação com `pkg`
- Compilação geralmente mais rápida, especialmente para projetos menores
- Boa integração com ferramentas de build e automação de tarefas

**Contras**

- Pode exigir configuração adicional para incluir dependências, embora ferramentas como `nexe-bundler` possam facilitar isso
- Menos flexibilidade em comparação com `pkg` em termos de opções de configuração e personalização

Ambas as ferramentas compilarão seu código Node.js para um binário executável, que será executado diretamente no sistema operacional alvo, sem a necessidade de ter o Node.js instalado. Isso pode resultar em melhor desempenho e um arquivo executável mais seguro, uma vez que o código-fonte não estará mais disponível em texto claro.

Em última análise, a escolha entre `pkg` e `nexe` dependerá das necessidades e requisitos específicos do seu projeto, bem como das características que são mais importantes por você, como desempenho, facilidade de uso, etc. Recomenda-se experimentar ambas as ferramentas em seu projeto para determinar qual funciona melhor para você.

Se segurança é a sua maior preocupação, tenha em mente que a compilação para binário pode não ser uma solução completa para proteger o código-fonte, pois ainda é possível descompilar o binário e recuperar parte do código original. Além disso, as versões compiladas podem ser mais difícieis de depurar e manter, portanto, considere cuidadosamente os prós e contras antes de decidir se deseja usar essa abordagem.

**Observações Importantes**

- Se você incluir scripts dentro do seu executável, eles não serão mais acessíveis como scripts diretamente
- O executável gerado pelo Nexe não é reconhecido como um executável pelo PM2, o PM2 ainda tenta executar o binário como arquivos JS
- Tanto o `pkg` quando o Nexe tiverem problemas em adicionar os arquivos do diretório **models** do meu projeto ao binário
    + Eles acabavam por adicionar dois de vários arquivos
    + Não sei se é algo específico com esse diretório, como o nome, por exemplo

# <a id="seguranca"></a>Segurança

Após compilar seu código-fonte Node.js em um binário usando ferramentas como `pkg` ou `nexe`, o código-fonte original não estará diretamente acessível como um arquivo JavaScript legível. Em vez disso, ele estará incorporado no binário executável gerado.

No entanto, é importante observar que embora o código-fonte não esteja diretamente acessível como um arquivo JavaScript, ainda é possível recuperá-lo com algum esforço usando técnicas de engenharia reversa. Isso pode ennvolver a descompilação do binário ou a **análise de seu conteúdo** para tentar extrair o código original.

Uma forma que eu encontrei para analisar o conteúdo do binário, foi a ferramenta `strings`.

Portanto, ao distribuir um binário compilado, você está protegendo seu código-fonte contra acesso casual, mas ele ainda pode ser ser acessível para alguém com habilidades e ferramentas adequadas para descompilar o binário.

Se a proteção do código-fonte é uma preocupação crítica para o seu projeto, é importante considerar outras medidas de segurança, como a utilização de técnicas de ofuscação de código, controle de acesso restrito ao binário compilado e o uso de soluções de gerenciamento de direitos digitais (DRM), dependendo do nível de segurança necessário.

# <a id="compilando-codigo-fonte-nexe"></a>Compilando o seu Código-fonte com o Nexe

- Instale o pacote Nexe globalmente através do npm
- Para compilar o seu projeto, utilize o comando `nexe -i server.js -o server --resource "./**/*" --target "8.16.0-linux-x64" --build --python "$(pyenv which python)" --verbose` no diretório raiz do seu projeto
    + Tenha em mente o seguinte contexto
        - Ubuntu 18.04.2 LTS
        - Node.js 8.16.0
        - Python 2.7.18
        - Por isso a versão utilizada do Nexe foi 3.3.3
        - **Especificar a versão do Python é necessário dependendo do seu projeto**
    + `-i`**:** específica o ponto de entrada da aplicação (`server.js`)
    + `-o`**:** caminho para o arquivo de saída. No comando acima, esta opção dá o nome `server` para o arquivo de saída
    + `--resource`**:** específica os recursos que devem ser incluídos na compilação. Neste caso, todos os que se encontram no diretório raíz do projeto
    + `--target`**:** específica o target. Específica a versão do Node.js a ser utilizada, assim como o sistema operacional e a sua arquitetura
    + `--build`**:** esta opção força o Nexe a compilar o Node.js a partir do código-fonte ao invés de usar um binário pré-compilado
    + `--python "$(pyenv which python)"`**:** específica a versão do Python a ser utilizada. Especificamos a versão do Python, porque o Node.js 8.16.0 utiliza o Python e não o Python 3
    + `--verbose`**:** define o modo do log como verbose

**Observações Importantes**

- **Verificar dependências** certifique-se de que todas as dependências necessárias para a compilação do Node.js estejam presentes no seu sistema, como Python e GCC/Clang
- **Tempo de compilação:** compilar o Node.js a partir do código-fonte pode ser um processo demorado, então tenha paciência
- **Testar o executável:** após a compilação, é crucial testar o executável em seu ambiente pretendido para garantir que todas as funcionalidades estejam operando como esperado

## <a id="compilando-codigo-fonte-nexe-especificacao-target"></a>Especificação de Target

Quando você usa o Nexe para compilar seu aplicativo, ele não necessariamente usa a versão do Node.js que está atualmente ativa no seu sistema via NVM ou qualquer outro gerenciador de versões. Em vez disso, o Nexe utiliza uma versão específica do Node.js que está incorporada dentro dos binários que ele cria, com base nas "targets" (alvos) que você específica ou que são assumidas por padrão.

Aqui está como isso funciona:

- **Especificação de Target:**
quando você compila seu aplicativo com o Nexe, pode especificar uma target de compilação que inclui a versão do Node.js. Por exemplo:

```bash
pkg server.js --target "8.16.0-linux-x64"
```

Nesse caso, você está especificando explicitamente que o binário deve usar o Node.js versão 8.16.0 para Linux x64.

- **Versão do Node.js na execução:** após a compilação, quando você executa o binário (`./server`), ele está executando o Node.js na versão embutida no binário, e não a versão que está instalada no seu sistema. Isso significa que independente de qual versão do Node.js você tem instalada via NVM ou instaladores diretos, o seu aplicativo empacotado sempre usará a versão que foi especificada durante a compilação com o Nexe

Portanto, digamos que você esteja usando Node.js 16.20.2 em seu ambiente de desenvolvimento, mas compilou seu aplicativo com um target `8.16.0`, o binário resultante está usando a versão específica do Node.js 8.16.0 que o Nexe tem disponível para esse target, que é diferente da versão Node.js 16.20.2.

## <a id="compilando-codigo-fonte-nexe-observacoes-importantes"></a>Observações Importantes

### Sumário

- [Configurações de Compilação Ideais](#compilando-codigo-fonte-nexe-observacoes-importantes-configuracoes-compilacao-ideais)
- [Recursos Não Sendo Incluídos no Compilado](#compilando-codigo-fonte-nexe-observacoes-importantes-recursos-nao-incluidos-compilado)
- [Problemas ao Tentar Comprimir o Compilado](#compilando-codigo-fonte-nexe-observacoes-importantes-problemas-tentar-comprimir-compilado)
- [Problemas de Segurança](#compilando-codigo-fonte-nexe-observacoes-importantes-problemas-seguranca)
- [Problemas de Depêndencias Externas](#compilando-codigo-fonte-nexe-observacoes-importantes-problemas-dependencias-externas)
- [Problemas com o PM2](#compilando-codigo-fonte-nexe-observacoes-importantes-problemas-pm2)

### <a id="compilando-codigo-fonte-nexe-observacoes-importantes-configuracoes-compilacao-ideais"></a>Configurações de Compilação Ideais

Mesmo com a última versão disponível (4.0.0-rc.6), a opção de configuração não funcionou no cenário acima (`--configure`). Eu queria fornecer os seguintes valores a ela (o comando ficaria assim, `nexe -i server.js -o server --resource "./**/*" --target "8.16.0-linux-x64" --build --python "$(pyenv which python)" --verbose --configure="--fully-static --without-node-options --without-dtrace --without-etw" --make="CFLAGS='-s' CXXFLAGS='-s'"`):

- `--configure`**:** inclui várias opções de configuração
- `--fully-static`**:** compila o Node.js como um binário totalmente estático, o que significa que todas as bibliotecas são embutidas no executável
- `--without-node-options`**:** remove opções de linha de comando desnecessárias
- `--without-dtrace` **e** `--without-etw`**:** desativa características de debugging que não são necessárias para muitos aplicativos
- `--make="CFLAGS='-s' CXXFLAGS='s'"`**:** instrui o compilador a "strip" (remover símbolos desnecessários) dos arquivos binários durante a compilação. A flag `-s` com os compiladores GCC/Clang remove informações de debug e símbolos desnecessários

O objetivo era garantir que o binário gerado pelo Nexe fosse o mais otimizado possível, sem informações de depuração e que fosse "stripped" (isto é, sem símbolos desnecessários). As flags acima seriam passadas ao script de configuração do Node.js para ajustar como o Node.js e o V8 seriam construídos.

As configurações acima deveriam ajudar a criar um binário mais leve e sem informações desnecessárias de depuração, adequado para distribuição e produção.

### <a id="compilando-codigo-fonte-nexe-observacoes-importantes-recursos-nao-incluidos-compilado"></a>Recursos Não Sendo Incluídos no Compilado

Outro problema vivenciado foi que o Nexe conseguia manipular arquivos de um diretório, mas outros não, mesmo todos possuindo as mesmas permissões. Por isso agora a opção `--resource` é utilizada, sendo que o seu valor é o diretório do projeto inteiro, para garantir que todos os arquivos serão incluídos no compilado.

### <a id="compilando-codigo-fonte-nexe-observacoes-importantes-problemas-tentar-comprimir-compilado"></a>Problemas ao Tentar Comprimir o Compilado

Quando você tenta diminuir o tamanho do seu binário utilizando o comando `strip` ou `upx`, ele acaba quebrando, e quando executado, imprime a mensagem abaixo:

```bash
$ ./server

_third_party_main.js:6
    throw 'Invalid Nexe binary';
    ^
Invalid Nexe binary
```

isso no Ubuntu 22.04.4 LTS, no Ubuntu 18.04.2 LTS, o seguinte erro é acusado

```bash
Segmentation fault (core dumped)
```

A forma encontrada para diminuir o tamanho do binário é utilizar o `upx` diretamente na runtime do node que será encapsulada junto com o restante do seu projeto, **se atente que isso só funciona para o Nexe 4.0.0-rc**. Para isso você precisa especificar a opção `--build`, ela irá buildar a engine dentro de `/home/$< usuário >/.nexe/$< versão do Node.js >/out/Release/`.

Por exemplo:

- `nexe -i server.js -o server --resource "./**/*" --target "8.16.0-linux-x64" --build --python "$(pyenv which python)"`
- A opção `--build`, considerando a opção `--target`, builda em **/home/$< usuário >/.nexe/** o diretório **/8.16.0/out/Release/**. Dentro dele está o binário **node**
- Especificamos a versão do Python, porque o Node.js 8.16.0 utiliza o Python e não o Python 3
- Você utiliza o comando `upx` no **node** (`upx node`)
- Com isso, como a engine está menor, o seu binário será menor, afinal, dentro do seu binário também vai a engine, além de todas as dependências necessárias para a execução do seu projeto

### <a id="compilando-codigo-fonte-nexe-observacoes-importantes-problemas-seguranca"></a>Problemas de Segurança

Outro ponto importante a se ressaltar, é que o código fonte se encontra dentro do compilado, ele ainda está lá, então se você utilizar o comando `strings $< binário >`, você consegue visualizá-lo.

### <a id="compilando-codigo-fonte-nexe-observacoes-importantes-problemas-dependencias-externas"></a>Problemas de Depêndencias Externas

Considerando o SO da máquina alvo (Ubuntu 18.04.2 LTS), o seguinte problema foi encontrado:

```bash
$ ./server
./server: /lib/x86_64-linux-gnu/libm.so.6: version `GLIBC_2.29' not found (required by ./server)
./server: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.34' not found (required by ./server)
./server: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.32' not found (required by ./server)
./server: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.28' not found (required by ./server)
./server: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.33' not found (required by ./server)
```

Como o SO da minha máquina é mais recente (Ubuntu 22.04.4 LTS) que o SO no qual o binário que eu compilei será executado, a GLIBC do meu binário era diferente daquela utilizada no servidor. Para resolver isso, foi utilizada uma VM com o mesmo SO (Ubuntu 18.04.2 LTS), e então, o binário foi compilado neste ambiente.

Outra alternativa é compilar uma versão estática do binário com o musl:

```bash
$ npx --package=node-musl musl-env npx nexe -i server.js -o server --resource "./**/*" --target "8.16.0-linux-x64" --build --python "$(pyenv which python)" --configure=--fully-static --verbose
```

Eu consegui criar o executável estático, mas na segunda tentativa de reproduzir o mesmo resultado, algo deu errado, tenha tenho certeza do que. Talvez eu que construir o Node.js do zero?

- Delete **/home/A< usuário >/.nexe/A< versão do Node.js >**
- Construa o Node.js do zero
- Aplique o `upx` na engine
- Compile tudo de novo
- Isso tudo utilizando o comando acima

### <a id="compilando-codigo-fonte-nexe-observacoes-importantes-problemas-pm2"></a>Problemas com o PM2

Pelo log abaixo, podemos observar que o nosso executável não é reconhecido pelo PM2, o PM2 ainda tenta executar o binário como um arquivo JS.

```bash
/usr/lib/node_modules/$< nome do proprietário do pacote >/$< nome do pacote >/server:1
(function (exports, require, module, __filename, __dirname) { ELF
                                                              ^

SyntaxError: Invalid or unexpected token
    at createScript (vm.js:80:10)
    at Object.runInThisContext (vm.js:139:10)
    at Module._compile (module.js:617:28)
    at Object.Module._extensions..js (module.js:664:10)
    at Module.load (module.js:566:32)
    at tryModuleLoad (module.js:506:12)
    at Function.Module._load (module.js:498:3)
    at Object.<anonymous> (/usr/lib/node_modules/pm2/lib/ProcessContainerFork.js:27:21)
    at Module._compile (module.js:653:30)
    at Object.Module._extensions..js (module.js:664:10)
```