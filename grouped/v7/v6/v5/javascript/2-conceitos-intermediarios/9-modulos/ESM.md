# ESM

O ESM (ECMAScript Modules) é o sistema de módulos nativo do JavaScript, introduzido no ES6 (ECMAScript 2015). Ele foi projetado para funcionar de forma eficiente tanto em navegadores quanto em ambientes de servidor, como o Node.js.

# Principais Características

1. **Sintaxe moderna:**
    - Usa as palavras-chave `import` e `export` para carregar e compartilhar módulos
    - É mais legível e permite exportações explícitas, facilitando a manutenção e a leitura do código
2. **Carregamento assíncrono:**
    - Em ambientes como navegadores, os módulos ESM podem ser carregados de forma assíncrona, sem bloquear a execução do restante do código
    - Isso melhora a performance de aplicações que dependem de múltiplos módulos
3. **Suporte nativo:**
    - O ESM é suportado de forma nativa em navegadores modernos e no Node.js
    - Isso permite escrever código modular sem a necessidade de ferramentas externas para transpilação em muitos casos

# Benefícios

1. **Tree-shaking:** ferramentas de bundling podem eliminar código morto (não utilizado) graças análise estática das importações e exportações
2. **Escopo de módulo:** todo código em um módulo ESM está no escopo local, evitando colisões de nomes
3. **Carregamento assíncrono em navegadores:** permite uma melhor performance em aplicações web
4. **Compatibilidade com ferramentas modernas:** suporte robusto em bundlers e ambientes modernos

# Observações

Embora o ESM (ECMAScript Modules) seja o sistema de módulos "nativo" do JavaScript moderno, especialmente em navegadores e versões recentes do Node.js, o comportamento padrão depende da configuração de ambiente.

## Node.js

- Por padrão, o Node.js ainda trata arquivos **.js** como CommonJS (CJS), a menos que você defina explicitamente `"type": "module"` no **package.json**. Isso ocorre por questões de compatibilidade retroativa, já que muitas bibliotecas e aplicações Node.js foram escritas usando CommonJS
- Quando você define `"type": "module"` no **package.json**, os arquivos **.js** são interpretados como ESM, e o `require` do CommonJS deixa de ser suportado. Nesse caso, você precisa usar `import/export` e não `require/module.exports`
- Outra forma de controlar o comportamento do módulo sem depender da chave `"type"` no **package.json** é utilizando as extensões:
    + **.mjs:** para arquivos que serão tratados como ESM
    + **.cjs:** para arquivos que serão tratados como Módulos CommonJS

# [[Próximo tópico: `strict mode`]](./strict-mode.md)