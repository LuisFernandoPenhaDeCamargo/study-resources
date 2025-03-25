<F

# Casas Decimais

<!-- O SQL trabalha em geral com 4 casas decimais? Modelo antigo do ChatGPT. -->

Em muitos sistemas de gerenciamento de banco de dados SQL, como MySQL e PostgreSQL, o tipo de dado padrão para valores de ponto flutuante (como `FLOAT` e `DOUBLE`) pode ter uma precisão padrão de até 4 casas decimais. No entanto, a precisão exata e o comportamento podem variar dependendo do tipo de dado utilizado.

Se você precisa de uma precisão específica, pode usar tipos como `DECIMAL` e `NUMERIC`, onde você pode especificar explicitamente o número de dígitos e casas decimais. Por exemplo, `DECIMAL(10, 4)` indica que o número pode te até 10 dígitos, com 4 deles após o ponto decimal.