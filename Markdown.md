# Markdown
**Up to date:** 07/09/2023.

## Regras gerais
- Não aceita recuo (criados por espaços ou por tabulações)
- **Linguagem de marcação** leve, focada em estruturação do texto, por isso não suporta o controle direto de cores

# Estruturas
- [Títulos e cabeçalhos](#tc)
- [Toogle list](#tl)

## <a id = "tc"></a>Títulos e cabeçalhos
Criado utilizando o caractere **"#"**, após ele, dê um espaço em branco. Quanto maior o número de caracteres **"#"** em sequência, menor será o nível do título.

### Exemplos
# Título de nível \# 
## Título de nível \## 
### Título de nível \### 
#### Titulo de nível \#### 
##### Título de nível \##### 
###### Título de nível \###### 
Este é o título de nível mais baixo.

**Observação:** para incluir o caractere **"#"** dentro de um título, foi utilizado o caractere **\\** (barra invertida) para indicar que ele é um texto literal, mais algum caractere após ele.

    \#<outro caracterer>

## <a id = "tl"></a>Toogle list
-  **\<summary> \</summary>:** título do bloco. No caso do bloco de alternância é ele que aparecerá quando o bloco estiver fechado

- **\<details> \</details>:** cria o elemento de detalhes que é usado para criar o bloco de alternância

### Exemplo
<details>
    <summary>Exemplo de Toogle List: conteúdo dentro do &ltsummary></summary>
        Conteúdo dentro do &ltdetails>.
</details>