# `obj.prototype` x Função Construtora

### 1. Propriedade `constructor` em `obj.prototype`

- A propriedade `constructor` em `obj.prototype` é apenas uma referência que o JavaScript cria automaticamente para indicar qual função construtora foi usada para criar o protótipo do objeto
- Ela **não tem a ver diretamente com a função construtora em si**; é apenas uma referência que pode ser modificada sem afetar o comportamento do operador `new`
- **Por exemplo:**

```JavaScript
function MyClass() {
    console.log(MyClass.prototype.constructor === MyClass);
}

new MyClass(); // Output: true
```

### 2. Função Construtora

- Quando você chama o operador `new`, o JavaScript segue um processo de criação de objetos. O `new` faz o seguinte:
    + Cria um novo objeto
    + Define o protótipo desse objeto como sendo o protótipo da função construtora (isto é, `obj.__proto__` é igual a `MyClass.prototype`)
    + Executa a função construtora (`MyClass`) com o novo objeto vinculado ao `this`
    + Se a função construtora não retornar um valor específico (como um objeto), o próprio objeto criado será retornado

Isso acontece internamente e **não está diretamente vinculado** à propriedade `constructor` no protótipo. Ou seja, o `new` invoca a função construtora diretamente e não se baseia na propriedade `constructor` do protótipo para fazer isso.

```JavaScript
function MyClass() {
    this.name = "example";
}

const instance = new MyClass();

console.log(instance.name); // Output: example
```

### 3. Como o `new` funciona internamente

O operador `new` é o responsável por invocar a função construtora e definir o `this`. A função construtora não precisa necessariamente ser vinculada ao protótipo do objeto diretamente. Por isso, **a função construtora e a propriedade** `constructor` **no protótipo são coisas diferentes**.

```JavaScript
function MyClass() {
    this.name = "Test";
}

MyClass.prototype.constructor = function() {
    console.log('This will note be called by "new"');
};

const obj = new MyClass(); // A função MyClass é chamada, não o prototype.constructor.
```

### 4. Diferença na chamada do `constructor`

- **Propriedade** `constructor`**:** usada principalmente como uma forma de referência ao construtor original que criou o protótipo do objeto
- **Função Construtora e** `new`**:** é invocada diretamente pelo operador `new` e não depende da propriedade `constructor` no protótipo

### 5. Recapitulando

- `obj.prototype.constructor` é uma propriedade no protótipo que aponta para a função que criou o objeto
- O `constructor` é uma **refência adicional**, mais para conveniência e legibilidade, qua ajuda a identificar a função construtora associada a um protótipo
- A **Função Construtora** (invocada por `new`) é a função que realmente constrói o objeto e configura seu estado, passando o `this` e adicionando propriedade a ele
- A invocação da Função Construtora é feita diretamente pelo operador `new` e não depende da propriedade `constructor`

Essa distinção explica por que alterar `obj.prototype.constructor` não altera o comportamento do `new`. A invocação do construtor é feita diretamente pelo operador `new` no momento da criação de uma nova instância, sem consultar essa propriedade `constructor`.

# [[Próximo tópico: ]]() <!-- TODO: definir o próximo tópico -->