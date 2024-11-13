# Padrões de Projeto (Node.js)

No desenvolvimento com Node.js, alguns padrões de projeto específicos ajudam a estruturar aplicações, facilitar a escalabilidade e melhorar a manutenção do código. Vou listar os padrões mais comuns e como eles são aplicados no contexto do Node.js.

# 1. Singleton

No Node.js, o padrão Singleton é muito útil para recursos que precisam de uma instância úica, como conexões a bancos de dados ou objetos de configuração.

```JavaScript
class DatabaseConnection {
    constructor() {
        if (DatabaseConnection.instance) {
            return DatabaseConnection.instance;
        }

        this.connection = this.connectToDatabase();
        DatabaseConnection.instance = this;
    }

    connectToDatabase() {
        // Código para conectar ao banco de dados.
    }
}

const db1 = new DatabaseConnection();
const db2 = new DatabaseConnection();

console.log(db1 === db2); // Output: true.
```

# 2. Factory

O padrão Factory é usado para criar objetos sem expor a lógica de criação ao cliente, e é ideial para instâncias que podem variar.

```JavaScript
// Exemplo não executável.

class LoggerFactory {
    static createLogger(type) {
        if (type === 'console') {
            return new ConsoleLogger();
        } else if (type === 'file') {
            return new FileLogger();
        }

        throw new Error('Logger type not supported.');
    }
}

const logger = LoggerFactory.createLogger('console');

logger.log('Log message');
```

# 3. Module Pattern

No Node.js, cada arquivo é um módulo, por isso o Module Pattern é nativo. Esse padrão encapsula código e mantém variáveis e funções privadas, promovendo a modularidade.

```JavaScript
// db.js

let connection = null;

export default function connect() {
    if (!connection) {
        connection = {}; // Imita uma conexão ao banco
    }

    return connection;
}
```

# 4. Observer

Usado para criar um sistema de eventos, onde um objeto "observa" outro para mudanças de estado. É útil no Node.js para event emitters, como o módulo EventEmitter.

```JavaScript
import EventEmitter from 'events';

const eventEmitter = new EventEmitter();

eventEmitter.on('data_received', (data) => {
    console.log('Data received:', data);
});

eventEmitter.emit('data_received', { id: 1, name: 'test' });
```

# 5. Middleware (Chain of Responsibility)

Esse padrão permite que requisições sejam passadas por um cadeia de handlers. No Node.js, frameworks como Expresse aplicam o padrão Middleware para processar requisições HTTP.

```JavaScript
import express from 'express';

const app = express();

app.use((request, response, next) => {
    console.log('Request received');

    next();
});

app.get('/', (request, response) => {
    response.send('Hello World');
});

app.listen(3000);
```

# 6. Proxy

O padrão Proxy cria um substituto para outro objeto, controlando o acesso a ele. Ele é putil para implementar cache ou controle de acessos.

```JavaScript
class APIProxy {
    constructor(apiInstance) {
        this.apiInstance = apiInstance;
        this.cache = new Map();
    }

    request(endpoint) {
        if (this.cache.has(endpoint)) {
            return this.cache.get(endpoint);
        }

        const result = this.apiInstance.request(endpoint);

        this.cache.set(endpoint, result);

        return result;
    }
}
```

# 7. Decorator

Usado para adicionar funcionalidades a objetos de forma dinâmica. No Node.js, é útil para extender funcionalidades sem alterar o código principal.

```JavaScript
function timestampDecorator(logger) {
    return {
        logFn2(message) {
            logger.logFn1(`[${new Date().toISOString()}] ${message}`);
        }
    }
}

const simpleLogger = {
    logFn1(message) {
        console.log(message);
    }
}

const loggerObj = timestampDecorator(simpleLogger);

loggerObj.logFn2('Hello world');
```

# 8. Facade

O Facade simplifica a interface de sistemas complexos, oferecendo uma interface mais amigável. Isso é comum para simplificar interações com APIs externas.

```JavaScript
class EmailServiceFacade {
    constructor(emailProvider) {
        this.emailProvider = emailProvider;
    }

    sendWelcomeEmail(userEmail) {
        const message = 'Welcome to our service!';

        return this.emailProvider.sendEmail(userEmail, message);
    }
}
```

# Resumo

Estes padrões de projeto são amplamente utilizados no desenvolvimento Node.js para melhorar a organização, a escalabilidade e a modularidade de aplicações. Cada padrão é aplicável a uma situação específica, proporcionando soluções robustas e flexíveis para diferentes desafios do desenvolvimento de software.

# [[Voltar para: Práticas e Padrões de Código]](../praticas-padroes-codigo.md)