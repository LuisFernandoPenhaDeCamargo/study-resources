# Testes.

# orion-backend-test

### Tecnologias.

- Esse teste tem o intuito de testar sua capacidade técnica em alguns pontos básicos, logo não vamos cobrar uma stack específica;
- Lembre-se de documentar e deixar claro como rodar o projeto, testes automatizados e outros;
- Deixe claro no README quais foram suas escolhas e o porquê delas, queremos entender a sua tomada de decisão, lembrando na entrega de valor, manutenibilidade e prazo dado para realizá-lo.

# A ideia é que você faça uma simples API com um website de pedidos.

### `api/register`

- Campos requeridos:

# <--


### `api/register`

* campos requeridos:
    - Nome: apenas os primeiros caracteres caixa alta, resto caixa baixa
    - RUT (CPF Chileno): 8 digitos numéricos + 1 verificador (se atentar a validação desde mecanismo)
    - email: apenas @gmail
    - senha: 12 caracteres, 2 minusculos, 2 maiusculos, 2 especiais, e sem repetir o mesmo caracteres por 3 vezes sequencialmente

    Obs: cada cliente deveria ter uma identificação única que será usada no pedido de um novo local

    Resposta: Sucesso ou não.
### `api/login`

* campos requeridos:
    - email
    - senha

    Devolver uma autorização única (fica a sua escolha qual método).


### `api/local_order` (necessário estar autorizado para acessar este endpoint)

* campos requiridos:
    - Distribuidor: EUA, México, Chile
    - Linguagem: Inglês, Espanhol
    - Contrato: Jogos multíplos, Único jogo
    - Porcentagem: Para jogos multíplos 30%, para único 10%
    - Quantidade de placas: até 10 por local
    - Jogos: "Halloween", "Valentine's day", "Easter Sunday", "New Year", "Lunar New Year", "Thanksgiving", "Día de Muertos"
      - Limite de 5 jogos por local
    - Nome do local: até 30 caracteres
    - Cidade

    Deverá devolver sucesso ou não da requisição, e gerar um "sku" com os dados acima como identificador único no banco (a seu critério, tente ser sucinto e claro nele, até 25 caracteres)

### `api/locals` (necessário estar autorizado)

    - devolver informações sobre os locais usando pesquisa parcial de sku e/ou nome e/ou cidade
## Extras:


### `admin/local_approval` (precisa estar autorizado)

    - Criar um endpoint que aprove os locais que foram criados (neste caso eles ficam em uma lista de espera para aprovação).
    - Ser capaz de deletar ou atualizar dados dos pedidos antes da aprovação.


## Diferencias:
    - Fazer o uso testes automatizados e/ou TDD
    - Seguir o padrão de conventional commits
    - Seguir alguma arquitetura de software e explicar sua decisão e trade-offs escolhidos