# Bash.

### Yes for all.

Para forçar a confirmação automática "sim" (yes) para todas as perguntas de confirmação ao usar comandos, você pode usar a opção `-f` (**force**) ou redirecionar a entrada padrão para `/dev/null`. No entando, tenha cuidado ao fazer isso, pois você pode excluir arquivos e diretórios acidentalmente sem a possibilidade de recuperação.

Usando a opção `-f`:\
Por exemplo, para remover um diretório chamado "meudiretorio" e responder automaticamente "sim" a todas as perguntas de confirmação, você pode fazer o seguinte:

`rm -rf meudiretorio`

O `-r` é usado para remover recursivamente e o `-f` é usado para forçar a remoção sem confirmação.

Redirecionando a entrada padrão para `/dev/null`:\
Outra abordagem é redirecionar a entrada padrão do terminal para `/dev/null`, o que efetivamente faz com que o comando pense que você respondeu "sim" a todas as perguntas de confirmação:

`yes | rm -r meudiretorio`

O comando `yes`gera uma saída contínua de "y" (yes) e a pipe `|` redireciona essa saída para o comando `rm`, que interpretará automaticamente como confirmação "sim".

# Lista de comandos.

- `ifconfig`**:** exibe informações sobre a interface de rede. Inclusive o **ip**, que se encontra a frente do **inet**, no bloco da sua interface de rede.\
[Explicação detalhada](#ifconfig);
- `cat arquivo`**:** exibe o conteúdo de arquivos de texto. [Explicação detalhada](#cat);
- `mv`**:** renomea e também pode mover arquivos e diretórios. [Explicação detalhada](#mv);
- `rm -r nome_do_diretorio`**:** remove um diretório. [Explicação detalhada](#rm);
- `sudo dpkg -i nome-do-arquivo.deb`: instala um pacote **.deb**;
- `node -v`**:** exibe a versão do Node.js que está sendo utilizada.

# Comandos.

## <a id = "ifconfig"></a>`ifconfig`

O comando  `ifconfig` é usado para exibir informações sobre as interfaces de rede em sistemas Unix-like. Ele fornece detalhes sobre as interfaces de rede ativas, como endereço IP, máscara de sub-rede, endereço MAC, pacotes transmitidos e recebidos, e muito mais. No entanto, a partir do macOS Catalina e das versões mais recentes, o `ifconfig` foi substituído pelo `ip`.

## <a id = "cat"></a>`cat`

O comando `cat` é uma ferramenta de linha de comando comumente usada em sistemas Unix-like para exibir o conteúdo de arquivos de texto. O nome "cat" é uma abreviação de "**concatenate**" (**concatenar**), embora também seja usado para imprimir o conteúdo de um único arquivo.

`cat arquivo`

`arquivo`**:** especifica o nome do arquivo cujo conteúdo você deseja exibir.

Por exemplo, para exibir o conteúdo de um arquivo chamado "**exemplo.txt**", você pode usar o seguinte comando:

`cat exemplo.txt`

O comando `cat` irá imprimir o conteúdo completo do arquivo "**exemplo.txt**" no terminal.\
Você também pode usar o `cat` para exibir o conteúdo de vários arquivos em uma única saída, concatenando-os. Por exemplo:

`cat arquivo1.txt arquivo2.txt`

Isso exibirá o conteúdo de "**arquivo1.txt**" seguindo pelo conteúdo de "**arquivo2.txt**".\
Além disso, o `cat` pode ser usado em combinação com redirecionamento de saída para criar ou sobrescrever arquivos de saída. Por exemplo, você pode usar o seguinte comando para criar um novo arquivo chamado "**novo_arquivo.txt**" contendo o conteúdo de "**arquivo1.txt**":

`cat arquivo1.txt > novo_arquivo.txt`

Lembre-se de que o `cat` é mais útil para exibir o conteúdo de arquivos de textos simples. Se você precisar visualizar ou manipular arquivos de texto mais complexos ou realizar operações mais avançadas, outras ferramentas e editores de txto podem ser mais apropriados.

## <a id = "rm"></a>`rm`

Para remover um diretório você pode usar o comando `rm` com a opção `-r` para excluir o diretório e seu conteúdo de forma recursiva.

`rm -r nome_do_diretorio`

Certifique-se de que você tem permissão para excluir o diretório e seu conteúdo. Se o diretório estiver vazio, você pode usar o comando `rmdir` para removê-lo.\
Por exemplo, se você deseja excluir um diretório chamado "meudiretorio", você pode usar o seguinte comando:

`rm -r meudiretorio`

Tenha muito cuidado ao usar o comando `rm -r`, pois ele excluir o diretórios e seu conteúdo sem a possibilidade de recuperação.

# `npm`

`npm install`**:** instala as dependências de um projeto Node.js. [Explicação detalhada](#npminstall).

### <a id = "npminstall"></a>`npm install`

`npm install -g pacote`**:** a opção `-g` é usada para instalar o pacote globalmente no seu sistema usando o npm. Isso significa que o pacote estará disponível em todo o seu sistema e não apenas em um projeto específico. Isso é útil para pacotes que fornecem ferramentas ou utilitários de linha de comando que você deseja acessar em qualquer lugar no sistema.

Lembre-se de que, ao instalar pacotes globalmente, eles não estarão vinculados a projetos específicos, e todas as versões dos pacotes globais serão compartilhadas em todo o sistema. Certifique-se de que o pacote que você está instalando globalmente é apropriado para uso em todo o sistema e que não causará conflitos com outras versões de pacotes instalados localmente em projetos específicos.

# `nvm`

- `nvm install versao`**:** instala uma versão específica do Node.js;
- `nvm ls`**:** lista as versões do Node.js e também mostra qual está atualmente em uso;
- `nvm use versao`**:** seleciona uma versão específica do Node.js.

# `mysql`

- `mysql -u usuario -p`**:** inicia uma sessão do MySQL no terminal, especificado o nome de usuário (`-u`) como `usuario` e solicitando a senha (`-p`) interativamente;
- `mysql -u usuario -p banco < dump.sql`**:** importa um dump para o banco. [Explicação detalhada](#importacaodedump).

## <a id = "importacaodump"></a> Importando um dump.

O comando `mysql -u usuario -p banco < dump.sql` é usado para importar dados de um arquivo SQL (geralmente um arquivo de despejo ou backup) para um banco de dados MySQL. Abaixo segue uma explicação por partes:

- `- usuario`**:** especifica o nome de usuário que você usará para se conectar ao MySQL;
- `-p`**:** isso indica ao MySQL para solicitar a senha do usuário interativamente, o que é uma prática mais segura do que colocar a senha diretamente na linha de comando;
- `banco`**:** especifica o nome do banco de dados no qual você deseja importar os dados;
- `< dump.sql`**:** redireciona a entrada do arquivo `dump.sql` para o comando MySQL. Isso significa que o MySQL lerá o conteúdo do arquivo `dump.sql` e importará os dados para o banco de dados especificado.\
Você também pode fornecer o path para o arquivo `.sql`, exemplo: `path/dump.sql`.

# `ngrok`

`ngrok http porta`**:** [executa um túnel](Ngrok.md#execucaotunel).

# `curl`

### Usando o cURL (Linha de comando).

Se você deseja enviar uma solicitação POST para o servidor Express usando a linha de comando, pode usar o `curl`. Certifique-se de que o `curl` esteja instalado em seu sistema e, em seguida, use o seguinte <a name = "comando"></a>comando:

`curl -X POST -d "nome=SeuNome&idade=30" http://localhost:3000/processar-dados`

O comando acima faz uma requisição ao servidor definido neste [código](JavaScript/bibliotecas.md#servidor).

O `-X POST` especifica que você está fazendo uma solicitação POST e o `-d` é usado para enviar dados. Entre as aspas duplas estão os dados que serão enviados.\
Considerando ainda que não é estritamente necessário que `X` e `POST` estejam em letras maiúsculas, mas é uma convenção comum escrever essas palavras em letras maiúsculas, de acordo com a especificação HTTP.\
Em outras palavras, usar `POST` e `X` em letras maiúsculas é a convenção recomendada para manter a consistência com os padrões web. Isso torna o código mais legível e evita possíveis problemas de compatibilidade com servidores e framworks que esperam métodos e cabeçalhos em letras maiúsculas.\
No entanto, na prática, muitos servidores e frameworks podem não ser sensíveis a maiúsculas e minúsculas e aceitarão `POST` e `X` em minúsculas. Mas é uma boa prática seguir a convenção e usar  `POST` e `X` em letras maiúsculas ao trabalhar com solicitações HTTP, especialmente quando se lida com bibliotecas ou serviçoes que seguem rigorosamente os padrões da web.