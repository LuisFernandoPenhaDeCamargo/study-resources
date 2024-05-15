# package.json

### Sumário

- [Chaves](#chaves)
    + [`scripts`](#chaves-scripts)
        - [Chaves da chave `scripts`](#chaves-scripts-chaves-chave-scripts)
- [Dependências Utilizadas por Um Pacote](#dependencias-utilizadas-pacote)
    + [Operadores de Versão](#dependencias-utilizadas-pacote-operadores-versao)
    + [Patch](#dependencias-utilizadas-pacote-patch)
- [package.json x package-lock.json](#packagejson-x-package-lockjson)

# <a id="chaves"></a>Chaves

1. `main`**:** a chave "`main`" especifica o ponto de entrada principal do seu pacote. Isso significa que quando alguém importa seu pacote em seu código usando `require()`, o arquivo especificado como `main` será o primeiro a ser carregado e executado  
    Portanto, se você está desenvolvendo uma biblioteca ou um módulo, você especifica o arquivo principal que outros desenvolvedores vão importar quando usarem seu pacote. Isso não cria um processo no momento da instalação, em vez disso, o arquivo especificado como `main` será carregado sempre que alguém importar seu pacote em seu código.
2. `bin`**:**
    - A chave "`bin`" é usada para definir os executáveis que serão instalados quando o pacote npm for instalado globalmente. Ele mapeia nomes de comandos que podem ser chamados a partir da linha de comando para arquivos JavaScript específicos no seu pacote. O valor de cada entrada nesta chave der ser o caminho relativo para o arquivo JavaScript que contém a lógica do comando
    - Por exemplo, se você tem um arquivo chamado `server.js` que deseja que seja executado como um comando `my-server`, você definiria a chave `"bin"` assim: `"bin": { "my-server": "./server.js" }`  
        Na verdade, para arquivos que se encontram diretamente no diretório raiz, não é necessário pontuar o caminho com "**./**" (o npm até emite um warning). Quando você específica o caminho para o binário, o npm o interpreta como um caminho relativo a partir do diretório raiz do projeto.
    - Durante a instalação global do pacote npm, um link simbólico será criado para cada comando especificado nesta chave, apontando para o arquivo JavaScript correspondente
3. `files`**:**
    - A chave `"files"` é usada para especificar quais arquivos e diretórios devem ser incluídos no pacote npm quando ele for publicado no registro npm. Você pode listar arquivos e diretórios individuais ou usar padrões de correspondência de globo (glob patterns) para incluir várias entradas
    - Por exemplo, se você deseja incluir apenas o arquivo `server.js` e o diretório **public**, você definiria a chave `"files"` assim: `"files": ["server.js", "public/**/*"]`
    - Todos os arquivos e diretórios especificados nesta chave serão incluídos no pacote npm quando você executar o comando `npm publish`

Essas são algumas das chaves fundamentais para configurar o comportamento do seu pacote npm.

## <a id="chaves-scripts"></a>`scripts`

A chave `scripts` no arquivo **package.json** é uma seção onde você pode definir vários scripts que podem ser executados usando o gerenciador de pacotes npm. Esses scripts são frequentemente usados para automatizar tarefas de desenvolvimento, como compilação de código, execução de testes, inicialização de servidores locais, entre outros.

A estrutura básica de um objeto `scripts` no **package.json** é um conjunto de pares de chave-valor, onde a chave é o nome do script e o valor é o comando a ser executado quando o script é chamado.

Aqui está um exemplo simples de um `scripts` no **package.json**:

```json
"scripts": {
    "start": "node server.js",
    "test": "mocha"
}
```

Neste exemplo:

- `start`**:** este é um script pré-definido que é comumente usado para iniciar a aplicação. Quando você executa `npm start`, o comando `node server.js` será executado, assumindo que `server.js` é o ponto de entrada da sua aplicação
- `test`**:** este é um script personalizado que pode ser usado para executar testes automatizados. Quando você executa `npm test`, o comando `mocha` será executado, assumindo que você está usando o framework de teste Mocha em seu projeto

Você também pode definir scripts personalizados para executar outras tarefas específicas do seu projeto. Esses scripts podem chamar **qualquer comando que você normalmente executaria no terminal**.

Além disso, você pode usar variáveis de ambiente especiais, como `npm_package_xx`, dentro dos scripts para acessar informações do projeto, como nome, versão, etc.

Em resumo, a chave `scripts` no **package.json** é uma maneira conveniente de definir e organizar comandos que podem ser executados facilmente usando o npm. Eles ajudam a automatizar tarefas de desenvolvimento comuns e a manter um fluxo de trabalho consistente em seu projeto.

### <a id="chaves-scripts-chaves-chave-scripts"></a>Chaves da chave `scripts`

Dentro da seção `scripts` do arquivo **package.json**, os nomes como `start` e `test` são apenas convenções comuns, mas você pode definir scripts com qualquer nome que desejar. No entanto, existem alguns scripts específicos que têm significados especiais e são executados automaticamente em certos momentos ou por certos comandos do npm.

- `start`**:** este script é executado automaticamente quando você executa `npm start` no terminal. Ele é frequentemente usado para iniciar o servidor ou aplicativo
- `test`**:** este script é executado automaticamente quando você executa `npm test` no terminal. É comumente usado para executar testes automatizados
- `postinstall`**:** este script é executado **automaticamente após a instalação do pacote**. Também é executado automaticamente após a instalação de dependências usando o comando `npm install`. É útil para realizar tarefas adicionais após a instalação, como compilar assets, construir pacotes ou configurar o ambiente de desenvolvimento

Embora `start`, `test` e `postinstall` tenham significados especiais e sejam executados automaticamente em certos contextos, outros `scripts` do **package.json** devem ser chamados explicitamente pelo desenvolvedor, geralmente usando o comando `npm run $< nome do script >`. Isso inclui scripts personalizados com nomes como `build`, `deploy`, `lint`, entre outros, que podem ser definidos conforme necessário para automatizar tarefas específicas do projeto.

`postinstall`

**Você não pode definir mais de uma chave** `postinstall` no arquivo **package.json**. A chave `postinstall` é uma **chave especial e única que especifica um script a ser executado após a instalação de um pacote** usando o comando `npm install`.

Se você definir mais de uma chave `postinstall`, o npm provavelmente irá considerar apenas a última delas e ignorar as anteriores, pois a estrutura do arquivo **package.json** não permite chaves duplicadas.

Se você precisar executar várias tarefas após a instalação de um pacote, você pode combinar essas tarefas em um único script `postinstall`, ou então criar um script que chama várias tarefas separadamente e definir esse script como a única chave postinstall. Por exemplo:

```json
"scripts": {
    "postinstall": "npm run task1 && npm run task2 && npm run task3"
}
```

Dessa forma, você pode definir uma sequência de tarefas a serem executadas após a instalação do pacote.

# <a id="dependencias-utilizadas-pacote"></a>Dependências Utilizadas por Um Pacote

As dependências e suas versões podem ser especificadas no arquivo **package.json** do projeto, mas isso não garante que essas serão sempre as versões utilizadas.

**Existem algumas situações** em que as versões das dependências podem ser diferentes:

1. **Instalação inicial:** quando você instala as dependências pela primeira vez usando `npm install` ou `yarn install`, as versões especificadas no **package.json** são usadas para determinar quais versões devem ser baixadas e instaladas. No entanto, essas versões podem ser atualizadas posteriormente
2. **Atualizações automáticas:** se você estiver especificado um intervalo de versões (por exemplo, `^1.0.0`), o npm ou o yarn podem instalar automaticamente a versão mais recente dentro desse intervalo sempre que você executar um comando de instalação de dependências. Isso pode levar a pequenas variações nas versões das dependências ao longo do tempo
3. **Resolução de conflitos de dependências:** se várias dependências do seu projeto especificarem versões diferentes de uma mesma dependência, o npm ou o yarn tentarão resolver esses conflitos, escolhendo uma versão que satisfaça todos os requisitos. Isso pode resultar em versões diferentes das dependências sendo instaladas do que as especificadas no **package.json**
4. **Atualizações manuais:** você ou outro desenvolvedor pode decidir atualizar manualmente as versões das dependências para corrigir problemas de segurança, adicionar novos recursos ou fazer outras alterações no projeto. Isso pode resultar em versões diferentes das especificadas no **package.json**

Para garantir que as versões das dependências sejam consistentes em diferentes ambientes de desenvolvimento e implantação, é uma prática recomendada travar as versões das dependências no **package.json** sempre que possível, usando operadores de versão específicos (por exemplo, `^1.0.0`, `~1.0.0`, ou `1.0.0`). Isso ajuda a minimizar surpresas e problemas de compatibilidade entre as diferentes versões de uma dependência.

## <a id="dependencias-utilizadas-pacote-operadores-versao"></a>Operadores de Versão <--

Os operadores de versão são usados no arquivo **package.json** para especificar as versões das dependências de um projeto. Eles permitem definir intervalos de versões que determinam quais versões específicas de uma dependência podem ser instaladas.

Aqui estão alguns dos operadores de versão mais comuns:

1. **Exato(**`version`**):** especifica uma versão exata que deve ser usada. Por exemplo, `lodash: "4.17.21"` irá instalar exatamente a versão `4.17.21` do pacote Lodash
2. **Caret(**`^$< versão >`**):** permite atualizações compatíveis com a versão especificada, incluindo patches e versões menores, mas não versões maiores. Por exemplo, `lodash: "^4.17.21"` permitirá qualquer versão que seja >=`4.17.21` <5.0.0
3. **Tilde(**`~$< versão >`**):** permite apenas atualizações de patch, mantendo a versão menor e maior fixa. Por exemplo, `lodash: "~4.17.21"` permitirá qualquer versão que seja >=`4.17.21` <4.18.0
4. **Intervalo(**`$< versão 1 > - $< versão 2 >`**):** especifica um intervalo de versões que podem ser usadas. Por exemplo, `lodash: "4.17.0 - 4.17.21"` permitirá qualquer versão entre `4.17.0` e `4.17.21`, inclusive
5. **Compatibilidade(**`$< versão1.x >` **ou** `$< versão1.* >`**):** permite qualquer versão que corresponda à versão principal especificada. Por exemplo, `lodash: "4.x"` permitirá qualquer versão que comece com `4`

Esses operadores de versão são úteis para garantir que as dependências sejam atualizadas de forma controlada e previsível, minimizando o risco de quebras de compatibilidade ou problemas inesperados devido a atualizações indesejadas.

## <a id="dependencias-utilizadas-pacote-patch"></a>Patch

No contexto de versões de software, um "patch" se refere a uma atualização que corrige bugs ou problemas menores em uma versão existente do software. Geralmente, um patch é identificado pelo último número em uma versão, por exemplo, `1.2.3`, onde `3` é o número do patch.

Os patches são usados para fazer pequenas correções ou melhorias em um software sem introduzir novos recursos ou alterar a funcionalidade existente de forma significativa. Eles são importantes para manter o software estável e livre de problemas, especialmente após o lançamento de uma versão principal.

Por exemplo, se um software possui a versão `1.2.3` e um problema de segurança é descoberto, os desenvolvedores podem lançar um patch na forma de `1.2.4` para corrigir esse problema específico, sem exigir que os usuários atualizem para uma nova versão principal.

Em resumo, um patch é uma atualização incremental que visa resolver problemas específicos sem introduzir mudanças drásticas na funcionalidade ou na interface do software.

# <a id="packagejson-x-package-lockjson"></a>package.json x package-lock.json

**package.json** e **package-lock.json** são dois arquivos importantes em projetos Node.js que desempenham papéis diferentes, mas estão relacionados entre si.

- **package.json:** este arquivo é essencial em qualquer projeto Node.js. Ele contém metadados sobre o projeto, como nome, versão, descrição e scripts de execução. Além disso, uma das partes mais importantes do **package.json** é a lista de dependências do projeto. Esta lista inclui todas as dependências necessárias para que o projeto seja executado corretamente, bem como as dependências de desenvolvimento (geralmente usadas durante o desenvolvimento, mas não necessárias para o ambiente de produção). Você também pode encontrar informações sobre os scripts de execução, como iniciar, testar ou construir o projeto
- **package-lock.json:** introduzido no npm versão 5, p **package-lock.json** é um arquivo que contém informações sobre a árvore de dependências exata e detalhes sobre cada pacote instalado em um projeto. Ele garante que, ao instalar as dependências em um novo ambiente, as mesmas versões exatas dos pacotes serão instaladas, evitando assim problemas de inconsistência de versões. Isso é especialmente útil para garantir a reprodutibilidade das builds em diferentes máquinas ou ambientes. O **package-lock.json** é gerado automaticamente sempre que as dependências do projeto são instaladas ou atualizadas, e deve ser commitado junto com o **package.json** no controle de versão do projeto

Em resumo, o **package.json** é onde você gerencia as informações do seu projeto e suas dependências, enquanto o **package-lock.json** é uma representação detalhada das dependências exatas do projeto, garantindo a consistência das versões instaladas. Ambos são essenciais para garantir um ambiente de desenvolvimento e produção estável e consistente em projeto Node.js.