# Sinon.JS

# Limitações do Uso de Fake Servers

O `createFakeServer` do Sinon.JS foi inicialmente projetado para ambientes de navegador onde XMLHttpRequest é nativamente suportado. Em Node.js, esse método não funciona diretamente, pois o ambiente não possui suporte embutido para XMLHttpRequest, o que resulta em limitações consideráveis ao tentar simular requisições HTTP.

Em um ambiente de teste, o erro `ECONNREFUSED` ocorre quando o cliente tenta se conectar a um servidor que não está ativo. Esse problema é comum quando o `createFakeServer` não está funcionando conforme esperado em Node.js, pois a chamada para XMLHttpRequest tenta alcançar um servidor real ao invés de usar o fake server, resultando em uma conexão recusada.

# [[Voltar para: Bibliotecas]](./1-bibliotecas.md)