# `axios.interceptors`

O `interceptors` é um recurso do Axios que permite interceptar requisições ou respostas, adicionando uma camada de lógica antes ou depois da solicitação HTTP ser enviada ou recebida. Isso é útil para modificar ou inspecionar os dados da requisição e resposta, além de lidar com erros de forma centralizada.

O `interceptors` possui dois tipos principais:

1. `axios.interceptors.request`**:** intercepta a requisição antes de ser enviada
2. `axios.interceptors.response`**:** intercepta a resposta depois de ser recebida

# Casos de Uso Comuns

1. **Autenticação:** adicionar tokens de autenticação automaticamente nas requisições
2. **Log de requisições/respostas:** inspecionar ou registrar detalhes das requisições e respostas
3. **Tratamento global de erros:** centralizar o tratamento de erros em um único lugar
4. **Modificação de URLs:** modificar URLs ou adicionar parâmetros de consulta dinamicamente

Os interceptadores tornam as requisições HTTP mais flexíveis e permitem um controle maior sobre o ciclo de vida das requisições e respostas.

# [[Voltar para: `axios`]](./1-axios.md)