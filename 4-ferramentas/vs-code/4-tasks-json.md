# tasks.json

O arquivo **tasks.json** no diretório **.vscode** é utilizado para definir tarefas automatizadas que ajudam a simplificar e acelerar processos recorrentes no desenvolvimento. Ele permite configurar uma série de tarefas personalizadas que podem ser executadas rapidamente pelo desenvolvedor, como compilação, execução de scripts, linting, e testes.

# Estrutura e Funcionalidade

O **tasks.json** possui uma estrutura em JSON que permite configurar as tarefas com detalhes como:

1. `label`**:** o nome da tarefa, usada para identificar e executar tarefas no VS Code
2. `type`**:** o tipo de tarefa, como `shell` para rodar comandos do terminal ou `process` para iniciar um processo
3. `command`**:** o comando principal a ser executado, como `npm install`, `tsc` (TypeScript compiler), ou `make` para compilar um programa
4. `args`**:** argumentos adicionais que podem ser passados ao comando especificado
5. `problemMatcher`**:** permite mapear erros e avisos resultantes da execução do comando, como erros de compilação, que serão destacados automaticamente no editor
6. `group`**:** define o grupo da tarefa, como `build` para tarefas de compilação ou `test` para tarefas de teste. Isso permite agrupar e facilitar a organização das tarefas
7. `presentation`**:** especifica como a saída da tarefa será apresentada, como `echo` para mostrar comandos ou `reveal` para exibir automaticamente o terminal

# Exemplo

### 1. Exemplo de configuração

Aqui está um exemplo de um arquivo **tasks.json** que define uma tarefa para compilar um projeto TypeScript:

```JSON
{
    "version": "2.0.0",
    "tasks": [
        {
            "label": "Compilar TypeScript",
            "type": "shell",
            "command": "tsc",
            "args": ["-p", "."],
            "group": "build",
            "problemMatcher": ["$tsc"],
            "presentations": {
                "reveal": "always",
                "echo": true
            }
        }
    ]
}
```

# Como Usar o tasks.json

Para executar uma tarefa configurada no **tasks.json**, basta:

1. Acessar o menu de tarefas com `Terminal > Run Task...` ou pressionando `Ctrl + Shift + B` (atalho padrão para tarefas de build)
2. Selecionar a tarefa que deseja executar

# Vantagens

- **Automatização:** automatiza processos repetitivos, aumentando a produtividade
- **Personalização:** define tarefas específicas do projeto
- **Integração com problemas:** mapeia erros e mensagens para serem exibidos no editor, facilitando a correção de problemas

O **tasks.json** é particulamente útil em projetos com compilação e scripts recorrentes, permitindo um fluxo de trabalho mais rápido e integrado dentro do VS Code.

# [[Próximo tópico: Extensões Utilizadas]](./5-extensoes-utilizadas.md)