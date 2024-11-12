# launch.json

O **launch.json** é um arquivo de configuração usado pelo VS Code para definir e personalizar o comportamento das sessões de depuração de um projeto. Ele fica localizado na pasta **.vscode** no diretório raiz do projeto e permite configurar como o VS Code deve iniciar, monitorar e exibir a saída de uma aplicação durante a depuração.

# Principais Funções

1. **Configuração de início de programa:** define o ponto de entrada do programa (como o arquivo principal do projeto), o tipo de ambiente (por exemplo, Node.js, Python, etc.), e como o VS Code deve iniciar a sessão de depuração (por meio de `launch` ou `attach`)
2. **Personalização da execução:** permite a configuração de variáveis de ambiente, argumentos de linha de comando, caminhos de arquivos e opções de compilação ou execução específicas, como especificar que o programa seja iniciado com uma ferramenta externa, como o Nodemon
3. **Debug remoto:** o **launch.json** pode ser usado para conectar o depurador do VS Code a uma aplicação que está rodando em outra máquina ou em um servidor, utilizando a opção `attach`. Isso é útil para depuração de servidores de produção ou ambientes de desenvolvimento na nuvem
4. **Automação e fluxo de trabalho:** permite automações que facilitam o fluxo de trabalho da equipe, ao ajustar variáveis e configurar o comportamento da depuração conforme necessário

# Vantagens

1. **Facilita a depuração consistente:** permite que todos os membros da equipe usem a mesma configuração de depuração
2. **Flexibilidade:** oferece controle detalhado sobre as sessões de depuração, como definir variáveis de ambiente e caminhos específicos
3. **Personalização do terminal:** é possível direcionar a saída para o terminal integrado ou de depuração, conforme necessário
4. **Integração com outras ferramentas:** funciona bem com ferramentas de monitoramento de arquivos como Nodemon, permitindo fluxos de trabalho de recarga automática

# Chaves

## Estrutura Básica

- `version`**:** a versão do formato do **launch.json**. `0.2.0` é a versão mais comum atualmente e específica o padrão seguido pelo VS Code para a estrutura e opções disponíveis no arquivo de configuração
- `configurations`**:** um array que contém todas as configurações de depuração para o projeto. Cada configuração é um objeto dentro deste array e pode conter diferentes ajustes para depurar várias partes do projeto ou mesmo com diferentes opções de execução

## Opções de Configuração de Depuração

Cada objeto dentro de `configurations` descreve uma configuração específica.

- `type`**:** o tipo de depuração. `node` indica que é uma configuração para um ambiente Node.js, permitindo ao VS Code utilizar o depurador do Node.js para monitorar e controlar a execução do código
- `request`**:** define como o VS Code vai iniciar o programa. O valor `launch` significa que ele será iniciado diretamente pelo depurador. Outra opção comum é `attach`, usada quando você quer que o depurador do VS Code se conecte a um processo Node.js que já está em execução
- `name`**:** um identificador descritivo para esta configuração de depuração. Esse nome aparece no menu de depuração para que você possa escolher a configuração correta
- `skipFiles`**:** uma lista de caminhos ou padrões de arquivos que o depurador vai ignorar ao rastrear a execução do código. `<node_internals>/**` ignora os arquivos internos do Node.js, tornando a depuração mais focada no código da aplicação em si
- `program`**:** especifica o caminho para o arquivo JavaScript que será executado. `${workspaceFolder}/app.js` seria o caminho do programa principal, que é o ponto de entrada da aplicação. `${workspaceFolder}` é uma variável que representa o diretório raiz do seu projeto aberto no VS Code
- `runtimeExecutable`**:** define o executável que vai rodar o programa. O valor `nodemon` indica que o Nodemon será usado para monitorar alterações no código e reiniciar automaticamente a aplicação sempre que algum arquivo for salvo
- `env`**:** permite configurar variáveis de ambiente para a sessão de depuração. A variável `NODEMON_CONFIG` indica que o Nodemon deve buscar suas configurações no arquivo fornecido, por exemplo, `${workspaceFolder}/config/nodemon.json`
- `console`**:** define onde a saída do programa será exibida. `integratedTerminal` faz com que a saída apareça no terminal integrado do VS Code, útil para visualizar logs e mensagens de execução como você veria em um terminal comum

O **launch.json** é essencial para personalizar e automatizar o processo de depuração no VS Code, ajudando a tornar o ciclo de desenvolvimento e correção de erros mais rápido e eficiente.

# [[Voltar para: Visual Studio Code]](./1-vs-code.md)