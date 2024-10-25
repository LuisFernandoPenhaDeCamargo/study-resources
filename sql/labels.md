<F

# Labels

Em SQL, labels (ou rótulos) são usados principalmente em procedures, funções e triggers para nomear blocos de código ou loops. Isso permite controlar o fluxo de execução do programa, especialmente ao usar comandos como `LEAVE` e `ITERATE` para sair ou continuar um loop ou bloco específico.

## Usos Comuns

1. **Labels em blocos:** um bloco de código pode ser nomeado com um label para facilitar a saída antecipada usando o comando `LEAVE`. Isso é útil em situações onde você quer evitar a execução do restante do código em determinadas condições
2. **Labels em loops:** você pode rotular loops para controlar o fluxo com comandos como `LEAVE` (sair de um loop) e `ITERATE` (pular para a próxima iteração do loop)

## Comandos Associados a Labels

- `LEAVE A< label >`**:** sai do loop ou bloco identificado pelo label. Útil para interromper a execução de um loop ou bloco quando uma condição é atendida
- `ITERATE  A< label >`**:** pula diretamente para a próxima iteração do loop identificado pelo label. Funciona de forma semelhante ao `CONTINUE` em outras linguagens de programação

## Exemplos

Um label é um identificador seguido por dois-pontos (`:`) que precedem um bloco ou loop.

### 1. Labels em blocos

```SQL
CREATE PROCEDURE example_procedure(IN example_value INT)

main_block: BEGIN

    DECLARE result INT;

    IF example_value < 0 THEN
        LEAVE main_block; -- Sai do bloco rotulado "main_block".
    END IF;

    SET result = example_value * 2;

    SELECT result;

END;
```

Neste exemplo, o bloco `main_block` é rotulado, e o comando `LEAVE main_block;` permite sair do bloco se uma determinada condição for atendida.

### 2. Labels em loops

```SQL
CREATE PROCEDURE loop_example()

BEGIN

    DECLARE x INT DEFAULT 0;

    outer_loop: LOOP
        IF x >= 5 THEN
            LEAVER outer_loop; -- Sai do loop quando `x >= 5`.
        END IF;

        inner_loop: LOOP
            IF x MOD 2 = 0 THEN
                ITERATE inner_loop; -- Continua para a próxima iteração do inner_loop.
            END IF;

            LEAVE inner_loop; -- Sai do inner_loop.
        END LOOP;

        SET x = x + 1;
    END LOOP;
END;
```

- `outer_loop` é o label do loop externo, e `LEAVE outer_loop;` sai do loop quando uma condição é atendida
- `inner_loop` é o label do loop interno, e `ITERATE inner_loop;` pula para a próxima iteração do loop

## Considerações

- **Escopo:** o label deve ser único dentro do escopo onde ele é definido. Por exemplo, você não pode ter dois loops ou blocos com o mesmo label dentro da mesma procedure ou função
- **Legibilidade:** usar labels torna o código mais legível e facilita o controle do fluxo em estruturas mais complexas, como loops aninhados

## Conclusão

Os labels em SQL são úteis para controlar o fluxo de execução em procedures, funções e triggers, especialmente em estruturas de loops ou blocos. Eles permitem a saída ou continuação em partes específicas do código de maneira organizada e eficiente.