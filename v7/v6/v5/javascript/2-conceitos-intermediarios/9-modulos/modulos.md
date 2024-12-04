# O que são Módulos?

## <a id="escopo-modulo">Escopo de Módulos</a>

- Cada arquivo de módulo tem seu próprio escopo
- Variáveis e funções declaradas em um módulo não são acessíveis fora dele, a menos que sejam exportadas

```JavaScript
// module1.mjs
export const moduleVar = "I'm in a module.";

// module2.mjs
import { moduleVar } from "./module1.js";

console.log(moduleVar); // Acessível aqui porque foi importado.
```