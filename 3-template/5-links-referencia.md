# Links de Referência

- **Métodos e propriedades de objetos:** utilize apenas o nome do método ou propriedade no link de referência, exceto quando o encadeamento de métodos ou propriedades for necessário para esclarecer sobre o que se trata

Template de links de referência específicos:

- `# [[Próximo tópico: A< nome do tópico >]](A< link de referência para o tópico >.md)`
- `# [[Voltar para: A< nome do tópico pai >]](A< link de referência para o tópico pai >.md)`
- `# [[Voltar para a página inicial]](../README.md)`

# [[Próximo tópico: ]]()

# Links de Referência

Links de referência não devem incluir o conteúdo entre parênteses do tópico (ou utilizar somente ele). Por exemplo:

O link de referência do tópico "Nome do Item (palavra ou frase)" seria "nome-item" ou "palavra-frase".

---

Links de referência não devem incluir o parâmetro do tópico. Por exemplo:

O link de referência do tópico "`´pm2 describe A< ID >´`" seria `describe`, pois `ID` é o seu parâmetro.

- Observe também que `pm2` não foi incluído, pois em tópicos cujo nome é um comando, se o comando possui uma parte que se repete por vários tópicos, ela deve ser removida. Isso ocorre em comandos nos quais você tem que especificar a ferramenta a ser utilizada, como os comandos do npm, por exemplo
- [Sobre blocos de código e crases](./Markdown.md#blocos-codigo-crases)

---

Links de referência devem utilizar apenas uma das frases separadas pelos dois pontos. Por exemplo:

O link de referência do tópico "palavra ou frase: outra palavra ou outra frase" seria "palavra-frase" ou "outra-palavra-outra-frase".

---

Links de referência devem substituir o ponto por um traço. Por exemplo:

O link de referência do tópico "palavra.outra palavra" seria "palavra-outra-palavra".

---

Quando for pontuar o próximo item de um tópico, utilize a estrutura conforme o exemplo abaixo:

```plaintext
### Sumário

- Tópico 1
- Tópico 2

No tópico 1:

# [[Próximo tópico: Tópico 2]](./topico-2.md)
```

---

Quando for pontuar o último item de tópico, utilize a estrutura conforme o exemplo abaixo:

```plaintext
### Sumário

- Tópico 1
- Tópico 2

No tópico 2:

# [[Voltar para: A< nome do tópico pai >]](../topico-pai.md)
```

---

Ao final de um tópico, adicione um link para retornar a "página inicial", conforme o exemplo abaixo:

```plaintext
# [[Voltar para a página inicial]](../README.md)
```