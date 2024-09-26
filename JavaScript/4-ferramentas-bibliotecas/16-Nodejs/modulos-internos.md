# Módulos Internos

Módulos internos (built-in) são partes do código Node.js que não são expostos diretamente para desenvolvedores via `require`, por exemplo. Eles são usados internamente pela própria implementação do Node.js.

Não são diretamente acessíveis para os desenvolvedores em código comum, em vez disso, são utilizados pelo próprio Node.js para implementar funcionalidades expostas através de módulos nativos ou outras APIs.

Observe que o módulo `module` é um caso especial, ele não é um módulo nativo no sentido comum, como o `fs`, por exemplo, mas é um módulo interno do Node.js que está disponível para uso. Neste [documento](./module.md) falaremos melhor sobre as funcionalidades dele.