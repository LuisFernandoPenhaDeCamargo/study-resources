# Nock

Nock é uma biblioteca de simulação (mocking) para Node.js, usada principalmente para interceptar e simular requisições HTTP em testes. Ela permite que você crie cenários de resposta para chamadas HTTP, evitando a necessidade de fazer chamadas reais para servidores externos, o que é especialmente útil para testes de APIs.

# Principais Características

- **Controle de erros HTTP:** simule códigos de status como 404, 500, etc.
- **Persistência e filtros:** configure interceptações persistentes para várias chamadas
- **Testes detalhados:** verifique se uma URL específica foi chamada ou o número de vezes que foi chamada

# Exemplos

### 1. Exemplo de simulação de requisição HTTP

Suponha que temos uma função que faz uma requisição HTTP para uma API externa. Podemos usar o Nock para interceptar essa requisição e retornar uma resposta simulada.

```JavaScript
import axios from 'axios';
import nock from 'nock';

// Função que faz uma requisição GET.
async function fetchData() {
    const response = await axios.get('https://api.example.com/data');

    return response.data;
}

// Teste com Nock.
nock('https://api.example.com')
    .get('/data')
    .reply(200, { message: 'Mocked response!' });

fetchData().then(data => {
    console.log(data);
});
```

1. **Interceptação da URL:** `nock('https://api.example.com').get('/data')` - intercepta a chamada para `https://api.example.com/data`
2. **Resposta simulada:** `reply(200, { message: 'Mocked response!' })` - define o código de status e o corpo da resposta
3. **Chamada da função:** `fetchData()` - faz a requisição HTTP, que é interceptada pelo Nock e recebe a resposta simulada

Esses recursos permitem criar testes robustos para funções que dependem de APIs externas, sem a necessidade de uma conexão com a internet.

# [[ Voltar para: Bibliotecas ]](./1-bibliotecas.md)