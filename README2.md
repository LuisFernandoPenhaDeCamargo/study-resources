- Porque Design Patterns está dentro de Arquitetura de Software e porque ambos estão em Fundamentos de Tecnologia?
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