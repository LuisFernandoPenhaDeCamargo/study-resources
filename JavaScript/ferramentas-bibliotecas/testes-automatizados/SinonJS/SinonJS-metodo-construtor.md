# Sinon.JS e o Método Construtor

Ao tentar utilizar o Sinon.JS para criar um stub do método construtor para observar e influenciar o seu comportamento, encontramos certas dificuldades. Devido à forma como o próprio JavaScript funciona, isso não é possível.

- Talvez a forma de lidar com isso seja a seguinte:
    + Preciso verificar os métodos `setPrototypeOf`, `getPrototypeOf` e a propriedade `__proto__`

```JavaScript
import sinon from "sinon";

class A {
    constructor() {
        console.log("A normal super class.");
    }
}

class B extends A {}

new A;   // Output: A normal super class.
new A(); // Output: A normal super class.
new B(); // Output: A normal super class.
Object.setPrototypeOf(B, sinon.stub().callsFake(function() { console.log("I am Super Stub!"); } ));
new A(); // Output: A normal super class.
new B(); // Output: I am Super Stub!

console.log(Object.getPrototypeOf(B).callCount);       // Output: 1

new B(); // Output: I am Super Stub!

console.log(Object.getPrototypeOf(B) === B.__proto__); // Output: true
console.log(Object.getPrototypeOf(B).callCount);       // Output: 2
```

---

```
import sinon from 'sinon';
import * as exampleModule from 'exampleModule';

describe('example', function(){
  it(function() {
    const classStubbedInstance = Sinon.createStubInstance(exampleModule.ExampleClass);
    const constructorStub = Sinon.stub(module, 'ExampleClass').returns(classStubbedInstance);

    sinon.assert.calledWith({some: 'args'})
  })
)
```

https://github.com/sinonjs/sinon/issues/1136#issuecomment-244608044