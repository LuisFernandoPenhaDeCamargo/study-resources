# <a id="pkg"></a>`pkg`

### Sumário

- [Dependências Externas](#dependencias-externas)
- [`pkg` x Nexe](#"pkg-x-nexe")
- [Segurança](#seguranca)
- [Arquivo de Serviço e PM2](#arquivo-serviço-e-pm2)
- [Compilando o seu Código-fonte com o `pkg`](#compilando-codigo-fonte-pkg)
    + [Especificação de Target](#compilando-codigo-fonte-pkg-especificacao-target)
    + [Observações Importantes](#compilando-codigo-fonte-pkg-observacoes-importantes)
      - [Recursos Não Sendo Incluídos no Compilado](#compilando-codigo-fonte-pkg-observacoes-importantes-recursos-nao-incluidos-compilado)
      - [`pkg` e o JavaScript obfuscator](#compilando-codigo-fonte-pkg-observacoes-importantes-pkg-javascript-obfuscator)
      - [`devDependencies`](#compilando-codigo-fonte-pkg-observacoes-importantes-devdependencies)

# <a id="dependencias-externas"></a>Dependências Externas

No contexto de ferramentas de geração de binários, "dependências externas" referem-se a bibliotecas, módulos, ou componentes de software que não fazem parte do código-fonte principal do projeto, mas são necessários para compilar, vincular, ou executar o binário gerado. Essas dependências podem incluir:

1. **Bibliotecas de sistema:** bibliotecas fornecidas pelo SO, como bibliotecas C padrão (GLIBC, no Linux), bibliotecas de rede, bibliotecas gráficas, etc
2. **Bibliotecas de terceiros:** bibliotecas ou frameworks desenvolvidos por terceiros, que são necessários para adicionar funcionalidades ao software, como `OpenSSL` para criptografia, `Boost` para várias utilidades em C++, etc
3. **Pacotes e módulos:** no caso de linguagens de alto nível como Python, Node.js, etc., podem incluir pacotes ou módulos instalados via gerenciadores de pacotes como `pip` (para Python) ou npm (para Node.js)
4. **Ferramentas de compilação e linkagem:** ferramentas necessárias durante a fase de compilação e linkagem, como `make`, `gcc` (GNU Compiler Collection), `ld` (GNU linker), etc.

**Exemplos**

1. **Bibliotecas de sistema:** se você estiver compilando um programa C que usa funções matemáticas avançadas, você pode precisar da biblioteca matemática padrão do C (`libm`):

```c
#include <math.h>
```

Aqui, `libm` é uma dependência externa

2. **Bibliotecas de terceiros:** para um projeto C++ que usa a biblioteca Boost:

```cpp
#include <boost/algorithm/string.hpp>
```

A biblioteca Boost deve estar instalada no sistema para compilar este projeto

3. **Pacotes e módulos:** para um projeto Node.js que depende do Express:

```javascript
const express = require("express");
```

O pacote Express deve ser instalado via npm

4. **Ferramentas de compilação e linkagem:** para um projeto que usa `make` para automatizar a compilação, `make` e o compilador especificado (como `gcc` ou `g++`) são dependências externas:

```makefile
all: myprogram

myprogram: main.o utils.o
  gcc -o myprogram main.o utils.o

main.o: main.c
  gcc -c main.c

utils.o: utils.c
  gcc -c utils.c
```

**Gerenciamento de Dependências**

As dependências externas são geralmente gerenciadas por:

- **Gerenciadores de pacotes:** como `apt`, `yum`, `brew` para bibliotecas de sistema, ou npm, `pip` para bibliotecas de linguagens específicas
- **Ferramentas de build:** como `CMake`, `make`, `Gradle`, `Maven` que podem baixar e configurar dependências
- **Arquivos de configuração:** como **package.json** para Node.js, **requirements.txt** para Python, **Cargo.toml** para Rust

**Importância das Dependências Externas**

Gerenciar corretamente as dependências externas é crucial para:

- **Compatibilidade:** garantir que todas as bibliotecas necessárias estão disponíveis e compatíveis com o projeto
- **Reprodutibilidade:** facilitar a replicação do ambiente de desenvolvimento em diferentes sistemas ou por diferentes desenvolvedores
- **Segurança:** manter as dependências atualizadas para evitar vulnerabilidades

Em resumo, dependências externas são componentes de software adicionais necessários para que um projeto funcione corretamente, e o gerenciamento eficaz dessas dependências é essencial para o sucesso do desenvolvimento e implantação do software.

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

Observe que tanto o `pkg` quanto o `nexe` são módulos distribuídos pelo próprio npm e podem ser instalados globalmente para uso em qualquer projeto Node.js.

Se segurança é a sua maior preocupação, tenha em mente que a compilação para binário pode não ser uma solução completa para proteger o código-fonte, pois ainda é possível descompilar o binário e recuperar parte do código original. Além disso, as versões compiladas podem ser mais difícieis de depurar e manter, portanto, considere cuidadosamente os prós e contras antes de decidir se deseja usar essa abordagem.

**Observações Importantes**

- Se você incluir scripts dentro do seu executável, eles não serão mais acessíveis como scripts diretamente
- O executável gerado pelo Nexe não é reconhecido como um executável pelo PM2, o PM2 ainda tenta executar o binário como arquivos JS
- Tanto o `pkg` quanto o Nexe tiverem problemas em adicionar os arquivos do diretório **models** do meu projeto ao binário
    + Eles acabavam por adicionar dois de vários arquivos
    + Não sei se é algo específico com esse diretório, como o nome, por exemplo

# <a id="seguranca"></a>Segurança

Após compilar seu código-fonte Node.js em um binário usando ferramentas como `pkg` ou `nexe`, o código-fonte original não estará diretamente acessível como um arquivo JavaScript legível. Em vez disso, ele estará incorporado no binário executável gerado.

No entanto, é importante observar que embora o código-fonte não esteja diretamente acessível como um arquivo JavaScript, ainda é possível recuperá-lo com algum esforço usando técnicas de engenharia reversa. Isso pode ennvolver a descompilação do binário ou a **análise de seu conteúdo** para tentar extrair o código original.

Uma forma que eu encontrei para analisar o conteúdo do binário, foi a ferramenta `strings`.

Portanto, ao distribuir um binário compilado, você está protegendo seu código-fonte contra acesso casual, mas ele ainda pode ser ser acessível para alguém com habilidades e ferramentas adequadas para descompilar o binário.

Se a proteção do código-fonte é uma preocupação crítica para o seu projeto, é importante considerar outras medidas de segurança, como a utilização de técnicas de ofuscação de código, controle de acesso restrito ao binário compilado e o uso de soluções de gerenciamento de direitos digitais (DRM), dependendo do nível de segurança necessário.

# <a id="arquivo-serviço-e-pm2"></a>Arquivo de Serviço e PM2

Mesmo após compilar seu aplicativo Node.js em um binário usando o `pkg`, você ainda pode gerenciar o binário usando ferramentas como PM2 e criar um arquivo de serviço para iniciar e gerenciar o processo.

Aqui estão os passos gerais para fazer isso:

1. **Instale o PM2 globalmente:**

```bash
$ npm install -g pm2
```

2. **Inicie o binário com o PM2:**

```bash
$ pm2 start seu-aplicativo-binario
```

3. **Verifique se o aplicativo está sendo executado corretamente:**

```bash
$ pm2 list
```

4. **Crie um arquivo de serviço para o PM2:**

Para garantir que o aplicativo seja iniciado automaticamente no boot do sistema e reiniciado em caso de falha, você pode criar um arquivo de serviço para o PM2. O procedimento para fazer isso pode variar dependendo do sistema operacional que você está usando.

- **Linux (systemd)** você pode criar um arquivo de serviço systemd para o PM2. Aqui está um exemplo genérico de como isso pode ser feito:
  + Crie um arquivo chamado **seu-aplicativo.service** em **/etc/systemd/system/** com o seguinte conteúdo:

```makefile
[Unit]
Description=Seu Aplicativo

[Service]
Type=simple
ExecStart=pm2 start seu-aplicativo-binario
Restart=always
User=seu-usuario
Group=seu-grupo

[Install]
WantedBy=multi-user.target
```

+ Substitua `seu-aplicativo-binario`, `seu-usuario` e `seu-grupo` pelos valores apropriados para o seu ambiente
+ Em seguida, habilite e inicie o serviço

```bash
$ sudo systemctl enable seu-aplicativo
$ sudo systemctl start seu-aplicativo
```

- **Windows:** para Windows, você pode criar um serviço usando ferramentas como NSSM (Non-Sucking Service Manager). O procedimento detalhado pode variar, mas o conceito é semelhante

Com o arquivo de serviço configurado, o PM2 será iniciado automaticamente com o sistema e seu aplicativo será gerenciado da maneira que você configurou com o PM2.

Em resumo, mesmo após compilar seu aplicativo Node.js em um binário, você ainda pode usar o PM2 para gerenciá-lo e garantir que seja iniciado e executado de forma confiável.

# <a id="compilando-codigo-fonte-pkg"></a>Compilando o seu Código-fonte com o `pkg`

- Instale o pacote `pkg` globalmente através do npm
- Para compilar o seu projeto, utilize o comando `pkg server.js -o server -t node16-linux-x64 --config package.json --compress Brotli` no diretório raiz do seu projeto
    + Certifique-se de que seu arquivo **package.json** esteja configurado corretamente, por exemplo, garanta que seu arquivo contenha todas as dependências e os scripts de inicialização apropriados
    + `server.js` seria o ponto de entrada da aplicação
    + `-o`**:** opção que nomeia o arquivo de saída, "`server`", no caso do comando acima
    + `-t`**:** específica o target. Específica a versão do Node.js a ser utilizada, assim como o sistema operacional e a sua arquitetura
    + `--config`**:** específica um arquivo de configuração que será utilizado na construção do binário
    + `--compress`**:** específica um algoritmo de compressão, isso irá gerar um binário menor

Após a conclusão do processo de compilação, o `pkg` deve ter criado um ou mais arquivos executáveis na mesma pasta onde você executou o comando. Esses arquivos serão **binários executáveis independentes** que você pode distribuir e executar em sistema compatíveis

## <a id="compilando-codigo-fonte-pkg-especificacao-target"></a>Especificação de Target

Quando você usa o `pkg` para compilar seu aplicativo, ele não necessariamente usa a versão do Node.js que está atualmente ativa no seu sistema via NVM ou qualquer outro gerenciador de versões. Em vez disso, o `pkg` utiliza uma versão específica do Node.js que está incorporada dentro dos binários que ele cria, com base nas "targets" (alvos) que você específica ou que são assumidas por padrão.

Aqui está como isso funciona:

- **Especificação de Target:**
quando você compila seu aplicativo com `pkg`, pode especificar uma target de compilação que inclui a versão do Node.js. Por exemplo:

```bash
pkg server.js -t node16-linux-x64
```

Nesse caso, você está especificando explicitamente que o binário deve usar o Node.js versão 16 para Linux x64. Se você não especificar um target, o `pkg` usará um default com a versão que você está utilizando no momento.

- **Versão do Node.js na execução:** após a compilação, quando você executa o binário (`./server`), ele está executando o Node.js na versão embutida no binário, e não a versão que está instalada no seu sistema. Isso significa que independente de qual versão do Node.js você tem instalada via NVM ou instaladores diretos, o seu aplicativo empacotado sempre usará a versão que foi especificada durante a compilação com `pkg`

Portanto, digamos que você esteja usando Node.js 16.20.2 em seu ambiente de desenvolvimento, mas compilou seu aplicativo com um target `node16`, o binário resultante está usando a versão específica do Node.js 16 que o `pkg` tem disponível para esse target, que pode ser diferente da versão 16.20.2.

## <a id="compilando-codigo-fonte-pkg-observacoes-importantes"></a>Observações Importantes

### <a id="compilando-codigo-fonte-pkg-observacoes-importantes-recursos-nao-incluidos-compilado"></a>Recursos Não Sendo Incluídos no Compilado

Um problema vivenciado foi que o `pkg` conseguia manipular arquivos de um diretório, mas outros não, mesmo todos possuindo as mesmas permissões. Por isso agora a opção `--config package.json` é utilizada, para garantir que todos os arquivos serão incluídos no compilado.

A chave no arquivo **package.json** utilizada para possibilitar isso é a chave "`pkg`", você deve especificar os caminhos relativos para os arquivos que você gostaria de incluir no binário, dentro de um array, sob a chave "`scripts`", conforme exemplo abaixo:

```json
{
    "pkg": {
        "scripts": [
            "./models/*.js"
        ]
    }
}
```

### <a id="compilando-codigo-fonte-pkg-observacoes-importantes-pkg-javascript-obfuscator"></a>`pkg` e o JavaScript obfuscator

Quando você obfusca um código com o Javascript obfuscator, se você aplicar o `pkg` neste código, um erro será gerado. O `pkg` não consegue criar um **executável funcional a partir do código obfuscado, eles são incompatíveis**.

### <a id="compilando-codigo-fonte-pkg-observacoes-importantes-devdependencies"></a>`devDependencies`

**Aparentemente** o `pkg` não empacota automaticamente as dependências de desenvolvimento (`devDependencies`) especificadas no **package.json** a menos que elas sejam explicitamente usadas pelo código incluído no binário. Normalmente, as dependências de desenvolvimento são usadas apenas durante o processo de desenvolvimento e construção, e não são necessárias no ambiente de produção.

No entanto, se uma dependência de desenvolvimento é realmente necessária em tempo de execução, você pode fazer com que o `pkg` inclua essas dependências de algumas maneiras:

1. **Mover dependências de desenvolvimento para dependências normais:** se você tem uma dependência que está em `devDependencies` mas é necessária em tempo de execução, mova-a para `dependencies`

```json
  "dependencies": {
    "express": "^4.0.0",
    "mocha": "^8.0.0"
  }
```

e remova-a de `devDependencies`:

```json
  "devDependencies": {
    "chai": "^4.0.0"
  }
```

2. **Incluir explicitamente arquivos necessários:** se você precisar incluir arquivos específicos que não são capturados automaticamente pelo `pkg`, pode especificá-los na seção `pkg` do **package.json**

```json
  "pkg": {
    "assets": [
      "path/to/needed/file.js"
    ],
    "scripts": [
      "path/to/needed/script.js"
    ]
  }
```

3. **Usar o campo pkg.files:** este campo pode ser usado para especificar quais arquivos e diretórios devem ser incluídos no pacote. Certifique-se de que ele está configurado corretamente para incluir todos os arquivos necessários

```json
  "pkg": {
    "files": [
      "server.js",
      "api/models/**",
      "config/**",
      "lib/**",
      "node_modules/your-dev-dependency/**"
    ]
  }
```