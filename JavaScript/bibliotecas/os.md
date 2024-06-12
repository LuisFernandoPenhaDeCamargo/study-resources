# `os` (Ok)

- O módulo `os` em Node.js está incluído na instalação padrão do Node.js
- Ele fornece várias utilidades relacionadas ao SO

### Sumário

- [`.cpus()`](#cpus)

# <a id="cpus"></a>`.cpus()`

É utilizado para **retornar uma matriz de objetos que descrevem cada CPU/núcleo disponível no sistema**. Esses objetos contêm detalhes sobre o modelo da CPU, a velocidade (em MHz), e os tempos de atividade de cada núcleo.

**Sintaxe Básica**

```JavaScript
os.cpus();
```

**Estrutura do Objeto CPU**

- `model`**:** uma string que descreve o modelo da CPU
- `speed`**:** a velocidade da CPU em MHz
- `times`**:** um objeto que contém diferentes tempos de atividade (em milissegundos) para a CPU
    + `user`**:** tempo gasto em processos no modo de usuário
    + `nice`**:** tempo gasto em processos no modo de usuário com menor prioridade
    + `sys`**:** tempo gasto em processos no modo do sistema (kernel)
    + `idle`**:** tempo que a CPU ficou ociosa
    + `irq`**:** tempo gasto em interrupções de hardware