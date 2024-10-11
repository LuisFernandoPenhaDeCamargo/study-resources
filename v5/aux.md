O id é a chave primária, vai incrementando.
Me parece que o server_id está ficando em 0, então não deve usar pra nada.
O game é o ID do jogo.
O machine_id é o ID da máquina (101, 102, etc.).
O board_id é o ID da placa.
O money_in e o money_out se referem ao valor que entrou ou saiu naquela operação. Não é o valor total da máquina.
O operation é o tipo da operação, IN entrada e OUT saída. Não sei o que é REV.
O payment_type é um desses tipos, mas acredito que a grande maioria será CASH. As outras opções acho que estão disponíveis para seleção no Caixa.
O transaction_owner acho que tem a ideia de falar se a transação foi feita pela máquina ou pelo Caixa. Não sei se isso está funcionando.
O validation é um código de validação da transação, não tenho certeza onde é usado.
O created é a data de criação.
O visitor não sei se é usado também, também acho que fica sempre em 0.
O card_id e o player_name acho que são de umas opções que já existiram ou pensaram em adicionar no Caixa, mas a gente não usa.
O exported_local não sei o que é, também me parece que fica sempre em 0.
O status_code está em 200 em todos os registros do servidor 3157. Não sei se acontece de ficar com valor diferente.
O exported_at deve ser a data de exportação, geralmente um pouco depois do created.

cashier.status_code: status da resposta da requisição que realizou a exportação dos registros