## Sumário

- [Fundamentos de Tecnologia (Conceitos Gerais)](./2-fundamentos-tecnologia/fundamentos-tecnologia.md)  
    Base teórica para compreender temas fundamentais da computação.
- [Tecnologias e Ferramentas (Práticas Específicas)](./3-tecnologias-ferramentas/tecnologias-ferramentas.md)
    <!-- TODO: Descrição a ser criada após reunir mais tópicos nesta seção para uma sugestão mais precisa. -->
- [Práticas de Desenvolvimento](./4-praticas-desenvolvimento/praticas-desenvolvimento.md)
    <!-- TODO: Descrição a ser criada após reunir mais tópicos nesta seção para uma sugestão mais precisa. -->
- [Documentação](./5-documentacao/documentacao.md)  
    Material técnico resumido sobre comandos, métodos e APIs, organizado por linguagem ou ferramenta para consultas rápidas.
- [Template](./1-template/template.md)  
    Estrutura base para contribuir com novos conteúdos no repositório, garantindo padronização e clareza.

---

- **[Fundamentos de Tecnologia](./Fundamentos/README.md):** Conceitos teóricos e princípios básicos, como redes, sistemas operacionais e arquitetura de computadores.
- **[Tecnologias e Ferramentas](./Tecnologias_Ferramentas/README.md):** Detalhes sobre linguagens de programação, frameworks e ferramentas específicas.
- **[Práticas de Desenvolvimento](./Praticas_Desenvolvimento/README.md):** Técnicas para estruturar e desenvolver software de qualidade.
- **[Documentação](./Documentacao/README.md):** Comandos, configurações e detalhes técnicos.
- **[Template e Estrutura](./Template/README.md):** Padrões de organização e templates para novos conteúdos.

---

- A seção de documentação que deve possuir comandos, métodos e funções, não? Então a estrutura abaixo não deve existir ("comandos")
└── 3-tecnologias-ferramentas/
    └── containeres/
        ├── containeres.md
        └── docker/
            ├── docker.md
            ├── conceitos/
            └── comandos/
Isso faz sentido?
- A seção "6" se chamará "Orion Games" (`6-orion-games`), é dedicada para a documentação das coisas da minha empresa
- Vou modificar a árvore e me alinhar sobre você, considerando o que estou pensando e qual a sua opinião sobre
```
/
├── 1-template/
│   └── template.md
├── 2-fundamentos-tecnologia/
│   ├── fundamentos-tecnologia.md
│   ├── arquitetura-software/
│   │   ├── arquitetura-software.md
│   │   └── design-patterns/
│   │       └── design-patterns.md
│   └── metodologias-desenvolvimento/
│       └── metodologias-desenvolvimento.md
├── 3-tecnologias-ferramentas/
│   ├── tecnologias-ferramentas.md
│   ├── editores-texto/
│   │   ├── editores-texto.md
│   │   ├── vim/
│   │   └── vs-code/
│   ├── linguagens-programacao/
│   │   ├── linguagens-programacao.md
│   │   ├── javascript/
│   │   │   └── sumario-javascript.md
│   │   ├── python/
│   │   ├── rust/
│   │   ├── golang/
│   │   └── csharp/
│   ├── repositórios-remotos/
│   │   └── repositorios-remotos.md
│   └── containeres/
│       ├── containeres.md
│       └── docker/
│           ├── docker.md
│           ├── conceitos/
│           └── comandos/
├── 4-praticas-desenvolvimento/
│   ├── praticas-desenvolvimento.md
│   └── testes-automatizados/
│       └── testes-automatizados.md
├── 5-documentacao/
│   ├── documentacao.md
│   ├── comandos/
│   │   └── docker-build.md
│   └── linguagens/
│       ├── javascript/
│       └── python/
├── 6-secao-pessoal/
│   ├── anotacoes.md
│   └── projetos-pessoais/
├── CONTRIBUTING.md
└── README.md
```
O README.md fica fora de qualquer seção, afinal, ele que irá direcionar para cada uma. Então eu o removi de 1-template
- Porque Design Patterns está dentro de Arquitetura de Software e porque ambos estão em Fundamentos de Tecnologia?  
    IF acima fizer sentido
    + Precisamos da seção Práticas de Desenvolvimento? Não podemos colocar Testes Automatizados dentro de Fundamentos de Tecnologia?
- Se eu for pontuar sobre o que foi visto acima (README), aonde você pontuaria este conteúdo?

---

🚀 Optimizing Node.js Performance with Native Tools: CPU Profiling Made Easy!

As developers, we all know how critical performance optimization is, especially when working on high-traffic applications. Have you ever wondered how to identify and fix bottlenecks in your Node.js app without relying on third-party tools? 🤔

Here's the good news: Node.js provides a built-in module, inspector, that allows you to profile CPU usage and pinpoint inefficiencies. Let me walk you through a simple example:

📄 The Setup: Using the inspector module, you can: 
1️⃣ Start a profiling session;
2️⃣ Collect performance data while your app is running;
3️⃣ Save the profile and analyze it using Chrome DevTools or another website (like cpupro).

Here's a quick snippet to get you started:

**credits to Erick Wendel and his amazing video https://lnkd.in/dcgUveQu

---

Um erro comum ao começar estudar processamento assíncrono no JavaScript, assim como conceitos de base como concorrência ou paralelismo, nos deparamos com situações que nos fazem pensar que o JavaScript é mágico e processa tudo de forma paralela ao usarmos o async e await.

Isso não é verdade! Lembrem: JavaScript é, por padrão, uma linguagem single thread. 

Ao usar async await, na verdade estamos registrando no event loop uma ação que deve ser executada no futuro, pelo pool de threads.

Essas ações ocorrem de forma CONCORRENTE, afinal temos apenas uma Thread principal na linguagem.

O que é concorrência? Todas as tasks registradas, no event loop, para serem executas, vão executar cada uma um pouquinho de cada vez. Isso é tão rápido que dá a impressão que foram executadas de forma paralela (simultaneamente).

É possível ter paralelismo no JavaScript? Sim, podemos usar Worker threads, mas aí já é outra discussão...

![alt text](image.png)

E iria mais longe! Não é porque é uma promise que eh async, promises sao encapsuladores de callbacks, ja vi gente pensando que iris executar em ordem diferente só por ser uma Promise com um for dentro 😂