# Frameworks

# Sumário

[`express`](#express).

# <a id = ""></a>`express`

Express é uma biblioteca para Node.js que é comumente referida como um framework web para Node.js.\
Express é um framework minimalista para a construção de aplicativos web e APIs em Node.js. Embora seja frequentemente chamado de "framework", ele é mais levemente estruturado do que alguns frameworks tradicionais, e muitas vezes é referido como uma "biblioteca" devido à sua natureza modular. Express fornece uma camada fina de abstração sobre o HTTP e facilita a criação de aplicativos web e APIs de forma rápida e flexível.\
Express é usada para simplificar o desenvolvimento de aplicativos web e APIs em Node.js. Ele fornece uma série de funcionalidades que facilitam o roteamento, a manipulação de solicitações e respostas HTTP, a definição de middleware, a renderização de visualizações e muito mais. Express é frequentemente usado como a base para o desenvolvimento de aplicativos web completos, mas também pode ser usado para criar APIs RESTful.\
Alguns dos principais recursos e conceitos do Express:

- **Roteamento:** o Express permite definir rotas para o seu aplicativo, mapeando URLs para funções de manipulação que você cria. Isso facilita a criação de endpoints para a sua API ou páginas web;
- **Middlewares:** os **middlewares são funções que podem ser usadas para processar solicitações HTTP no Express**. Você pode usar middlewares para executar ações comuns, como autenticação, tratamento de erros, registro de solicitações e respostas, entre outros;
- **Solicitações e respostas:** o Express simplifica a manipulação de solicitações HTTP e respostas. Você pode acessar informações da solicitação, como parâmetros, cabeçalhos e corpo, e enviar repostas personalizadas para o cliente;
- **Templates:** o Express pode ser combinado com mecanismos de template, como EJS, Pug (antigo Jade), Handlebars e outros, para criar visualizações dinâmicas para suas páginas da web;
- **Conexão a banco de dados:** você pode facilmente se conectar a bancos de dados, como MongoDB, MySQL ou PostgreSQL, usando bibliotecas específicas do banco de dados e middlewares de conexão;
- **MVC (model-view-controller):** o Express não impõe uma estrutura específica de arquitetura, mas é comumente usado com o padrão de design MVC para organizar aplicativos;
- **Extensibilidade:** o Express é altamente extensível. Você pode adicionar middlewares de terceiros para adicionar funcionalidades adicionais ao seu aplicativo;
- **Suporte para WebSocket:** enquanto o Express não oferece suporte direto a WebSocket, você pode combinar o Express com bibliotecas como Socket.io para adicionar funcionalidades de tempo real ao seu aplicativo;
- **Comunidade ativa:** o Express é amplamente adotado e tem uma comunidade ativa que fornece pacotes, plugins e suporte.

Exemplo de uso básico do Express para criar um servidor HTTP:

```JavaScript
const express = require("express");

const app = express();
const port = 3000;

app.get("/", (req, res) => {
    res.send("Hello, World!")
});

app.listen(port, () => {
    console.log(`Servidor Express escutando em http://localhost:${port}`);
});
```

Neste exemplo, o Express é utilizado para criar um servidor HTTP que responde "`Hello, World!`" quando acessado no caminho raiz ("`/`").

### Objeto Response e seus Métodos

No Express.js, o objeto `response` (às vezes abreviado como `res`) é passado como argumento para a função de callback que é definida para as rotas do seu aplicativo. O objeto `response` fornece métodos que permitem que você envie respostas HTTP para o cliente.

# ---

### Métodos.

- [`.Router()`](#router);
- [`.post()`](#post);
- [`.status()`](#status);
- [`.json()`](#json);
- [`timeout()`](#timeout);
- [`before()`](#before);
- [`after()`](#after);
- [`done()`](#done).

# métodos Express

### <a id = "post"></a>`.post()`

Define uma rota que responde a requisições HTTP POST. Retorna um objeto do tipo `Router`.

`router.post(path, callback, callback)`

- `path` **(string):** especifica o caminho da URL no qual a rota deve corresponder;
- **Manipulador (handler,** `callback`**, opcional):** uma função que é executada quando a rota corresponde a uma requisição POST e é responsável por lidar com a lógica da rota;
    - `req` **(requisição, objeto):** este objeto contém informações sobre a requisição HTTP, como parâmetros de consulta, corpo da requisição, cabeçalhos e muito mais;
    - `res` **(resposta, objeto):** este objeto é usado para construir e enviar uma resposta ao cliente, incluindo status HTTP, cabeçalhos e corpo da resposta.
- **Funções intermediárias (middleware,** `callback`**, opcional):** você pode fornecer uma ou mais funções intermediárias que são executadas antes do manipulador principal. Isso é útil para adicionar lógica de autenticação, validação, etc. **São chamadas em ordem sequencial, a última função que deve ser chamada é o handler**.

# <a name = "mocha"></a>Mocha.

### Hooks.

**Hooks**, ou **ganchos** são funções que você pode definir para executar ações antes ou depois dos casos de teste.

Isso ajuda a configurar ou limpar o ambiente de teste. Essas funções são executadas automaticamente em momentos específicos durante a execução dos testes.\
O Mocha fornece ganchos `before` e `after` para esses fins.

### <a id = "timeout"></a>`timeout()`

Dentro de um bloco de teste, você pode definir o limite de tempo para a sua execução.

`this.timeout(tempo)`

`tempo`**:** tempo limite em milissegundos.

### <a id = "before"></a>`before()`

É executado uma vez antes de todos os casos de teste no bloco `describe()`.

`before(callback)`

`callback`**:** função de callback.

Ele pode ser utilizado para configurar recursos necessários ou para realizar tarefas de inicialização que se aplicam a todos os casos de teste dentro desse bloco. Por exemplo, você pode usar `before()` para criar instâncias de objetos que serão usados em vários testes.

### <a id = "after"></a>`after()`

É executado uma vez depois de todos os casos de teste no bloco `describe()`.

`after(callback)`

`callback`**:** função de callback.

Ele é útil para limpar recursos ou realizar tarefas de encerramento que se aplicam a todos os testes no bloco. Por exemplo, você pode usar o gancho `after()` para fechar conexões de banco de dados ou liberar recursos após a execução dos testes.

### <a id = "done"></a>`done`

O `done` é uma função que é frequentemente usada em testes com a estrutura de testes Mocha, que é uma estrutura popular para escrever testes em JavaScript. Ela não é uma função global, mas sim um argumento que você pode passar para sua função de teste (também conhecida como função de callback) quando você está escrevendo testes usando Mocha.

O `done` é usado para indicar quando um teste assíncrono está completo. Quando você executa testes que envolvem operações assíncronas, como solicitações de rede, leitura de arquivos ou qualquer outra operação que não seja imediatamente concluída, você precisa informar ao Mocha quando o teste deve ser considerado como "passou" ou "falhou". O `done` é a maneira de fazer isso.

Quando você passa o `done` como um argumento para a função de teste, você pode chamá-lo quando a operação assíncrona estiver completa. Se tudo ocorrer conforme o esperado, você chama `done()` sem argumentos para indicar que o teste passou, Se ocorrer um erro ou uma condição inesperada, você pode passar um argumento para `done`, por exemplo, `done(error)`, para indicar que o teste falhou com um erro. Exemplo:

```JavaScript
it("Deve verificar algo assíncrono.", function(done) {
    //Execute uma operação assíncrona, por exemplo, uma solicitação de rede.
    asyncOperation(function(error) {
        if (error) {
            //Se ocorrer um erro, chame done com o erro para indicar que o teste falhou.
            done(error);
        } else {
            //Se tudo ocorrer bem, chame done sem argumentos para indicar que o teste passou.
            done();
        }
    });
});
```

Quando você chama `done()` o Mocha entende que o teste está completo e passou. Quando você chama `done(error)` o Mocha entende que o teste falhou com o erro especificado.

# <a name = "vuejs"></a>Vue.js.

### Resumo.

Framework progressivo usado para construir interfaces de usuário (UI) interativas e baseadas em componentes. Ele é amplamente utilizado no desenvolvimento web front-end e é conhecido por sua simplicidade e facilidade de integração com outros projetos e bibliotecas.

---

Alguns pontos-chave relacionados ao uso de Vue.js:

- **Desenvolvimento front-end:** Vue.js é usado para criar a camada de interface do usuário em uma aplicação web. Ele permite que os desenvolvedores criem componentes reutilizáveis que podem ser compostos para criar interfaces complexas;
- **Reatividade:** uma das características mais poderosas do Vue.js é sua capacidade de criar interfaces reativas. Isso significa que os componentes podem automaticamente reagir a mudanças nos dados e atualizar a interface do usuário correspondente;
- **Facilidade de aprendizado:** Vue.js é conhecido por sua curva de aprendizado suave. Mesmo desenvolvedores com conhecimento JavaScript básico podem começar a usá-lo rapidamente;
- **Integração:** Vue.js é altamente integrável com outras bibliotecas e frameworks, como Vuex para gerenciamento de estado e Vue Router para roteamento. Isso o torna uma escolha popular para projetos que precisam de uma solução front-end flexível;
- **Comunidade ativa:** Vue.js possui uma comunidade ativa e crescente de desenvolvedores. Isso significa que você pode encontrar muitos recursos, tutoriais e plugins disponíveis para ajudar no desenvolvimento;
- **Ferramentas de desenvolvimento:** há uma série de ferramentas de desenvolvimento dedicadas ao Vue.js, como o Vue CLI, que facilitam a criação, compilação e gerenciamento de projetos Vue.js;
- **Aplicações em tempo real:** Vue.js é frequentemente usado em aplicações em tempo real, como painéis de administração, aplicativos de chat e aplicativos de jogos web, devido à sua reativdade e capacidade de atualização em tempo real;
- **Documentação rica:** a documentação oficial do Vue.js é extensa e bem escrita, facilitando a aprendizagem e a consulta de informações quando necessário;
- **Adoção empresarial:** muitas empresas, grandes e pequenas, adotaram Vue.js em seus projetos devido à sua eficiência e flexibilidade.

# <a name = "nextjs"></a>Next.js.

### Resumo.

Utilizado para criar aplicativos web do lado do servidor (SSR) e do lado do cliente. Ele é frequentemente usado com React, mas também pode ser usado com outros frameworks de front-end. Next.js é conhecido por suas capacidades avançadas de renderização, roteamento e facilidade de desenvolvimento, o que o torna uma escolha popular para desenvolvedores que desejam criar aplicativos da web modernos e de alto desempenho.

---

Algumas das principais características e conceitos asssociados ao Next.js:

- **Renderização universal:** Next.js oferece suporte para renderização universal, o que significa que você pode renderizar páginas tanto no lado do servidor quanto no lado do cliente. Isso melhora a velocidade de carregamento da página e a experiência do usuário;
- **Roteamento dinâmico:** o roteamento do Next.js é simples de configurar e oferece suporte a rotas dinâmicas. Isso significa que você pode criar URL’s amigáveis para o usuário e carregar dados com base nos parâmetros da rota;
- **Pré-processamento:** Next.js suporta pré-processamentos de CSS, permitindo que você use tecnologias como CSS Modules, Styled Components e outras soluções para estilização;
- **Carregamento otimizado:** ele fornece um sistema de carregamento otimizado que permite ao usuário carregar apenas o código JavaScript necessário para a página atual;
- **API routing:** além de renderizar páginas, o Next.js também permite criar API endpoints facilmente usando a mesma estrutura de roteamento;
- **Suporte a TypeScript:** Next.js é compatível com TypeScript, o que é uma vantagem para desenvolvedores que desejam adicionar tipos estáticos ao código;
- **Integração com React:** é muito comum usar Next.js com React, aproveitando o poder do React para criar componentes reutilizáveis e criar interfaces de usuário interativas;
- **Ecossistema rico:** Next.js possui uma comunidade ativa e um ecossistema de bibliotecas e plugins para ajudar no desenvolvimento;
- **Deploy fácil:** é relativamente simples implantar aplicativos Next.js em várias plataformas de hospedagem, como Vercel, Netlify, AWS, entre outras;
- **Desenvolvimento local simples:** Next.js inclui um servidor de desenvolvimento com atualização automática, o que facilita o desenvolvimento e o teste local;
- **Bibliotecas adicionais:** você pode adicionar facilmente bibliotecas populares, como Redux, para gerenciar o estado da aplicação, conforme necessário.