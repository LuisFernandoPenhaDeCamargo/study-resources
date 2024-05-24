# Linux

### Sumário

- [Sistema Hierárquico de Arquivos](#sistema-hierarquico-arquivos)
    + [~/]
    + [/proc](#sistema-hierarquico-arquivos-proc)
- [systemctl](#systemctl)
    + [Comandos Utilizados Através do CLI](#systemctl-comandos-utilizados-cli)
        - [`daemon-reload`](#systemctl-comandos-utilizados-cli-daemon-reload)
- [Snap](#snap)
- [GLIBC](#glibc)

# <a id="sistema-hierarquico-arquivos"></a>Sistema Hierárquico de Arquivos

### Sumário

- [~/](#sistema-hierarquico-arquivos-simbolos-especiais)
- [/proc](#sistema-hierarquico-arquivos-proc)

## <a id="sistema-hierarquico-arquivos-simbolos-especiais"></a>~/

- A referência "`~/`" no contexto de sistemas de arquivos Unix e Unix-like (como Linux e macOS) é uma notação abreviada para o diretório home do usuário atual
- O diretório home é um diretório específico designado para cada usuário no sistema. Ele contém todos os arquivos e subdiretórios pessoais do usuário, incluindo configurações de ambiente, documentos, downloads, e outros dados do usuário
    + Muitos arquivos de configuração pessoal são armazenados no diretório home
    + No caso do usuário "`usuario`", `~/` seria equivalente a "`/home/usuario`"

## <a id="sistema-hierarquico-arquivos-proc"></a>/proc

**/proc** é um sistema de arquivos virtual do Linux que fornece informações sobre o sistema, incluindo informações sobre processos em execução.

**Exemplos Interessante**

```bash
$ cat /proc/$< PID >/environ | tr '\0 \n'
```

O comando `cat /proc/$< PID >/environ | tr '\0 \n'` é usado para exibir o ambiente de um processo específico no Linux. Isso pode ser útil para ver as variáveis de ambiente que estão sendo passadas para um determinado processo.

- `cat`**:** é um comando usado para concatenar e exibir o conteúdo de arquivos
- `/proc`**:** é um sistema de arquivos virtual do Linux que fornece informações sobre o sistema, incluindo informações sobre processos em execução
- `environ`**:** é um arquivo especial dentro do diretório **/proc/$< PID >** que contém as variávies de ambiente do processo

A saída do comando acima seria uma sequência de variáveis de ambiente, cada uma delas em uma linha separada e com o formato `NOME=VALOR`. No entanto, como as variáveis de ambiente são separadas por null bytes, geralmente é útil usar o comando `tr` (translate) para substituir os null bytes por quebras de linha (`/n`), tornando a saída mais legível.

Portanto, o comando completo `cat /proc/$< PID >/environ | tr '\0 \n'` exibirá as variáveis de ambiente do processo especificado pelo PID, com cada variável em uma linha separada.

# <a id="systemctl"></a>`systemctl`

## <a id="comandos-utilizados-cli"></a>Comandos Utilizados Através do CLI

### Sumário

- [`daemon-reload`](#systemctl-comandos-utilizados-cli-daemon-reload)

### <a id=""></a>`systemctl daemon-reload`

É utilizado para **recarregar os arquivos de configuração das unidades** (serviços, sockets, targets, etc.) do systemd. Este comando é necessário após qualquer modificação nos arquivos de configuração das unidades, como criação, alteração ou remoção de arquivos **.service**, **.socket**, **.target**, etc.

**Quando Usar**

1. **Depois de criar um novo arquivo de unidade:** se você adicionou um novo arquivo de serviço em **/etc/systemd/system** ou **/lib/systemd/system**, precisa informar ao systemd sobre essa nova unidade
2. **Depois de modificar um arquivo de unidade existente:** se você editou um arquivo de serviço, como alterar comandos em `ExecStart` ou modificar variáveis de ambientes
3. **Depois de remover um arquivo de unidade:** se você removeu um serviço que não é mais necessário

**Porque é Necessário?**

O systemd lê os arquivos de configurações das unidades durante a inicialização do sistema e mantém essas informações em cache para melhorar o desempenho. Quando você faz alterações nos arquivos de configuração, o systemd precisa ser informado para recarregar essas configurações e atualizar seu cache. O comando `systemctl daemon-reload` faz exatamente isso.

**Considerações**

- **Não reinicia serviços automaticamente:** o comando `daemon-reload` não reinicia os serviços que já estão em execução. Se você precisar aplicar as mudanças em um serviço em execução, você terá que reiniciar manualmente esse serviço usando `systemctl restart $< serviço >`
- **Não recarrega arquivos de configuração de serviços:** se você alterou os arquivos de configuração que o serviço lê (por exemplo, arquivos de configuração específicos da aplicação), você ainda precisa reiniciar o serviço para aplicar essas mudanças

O comando `systemctl daemon-reload` é uma ferramenta essencial para a administração de sistemas baseados em systemd, garantindo que qualquer alteração nos arquivos de configuração das unidades seja reconhecida e aplicada corretamente pelo daemon do systemd.

# <a id="snap"></a>Snap

O Snap é um sistema de empacotamento de aplicativos desenvolvido pela Canonical, a mesma empresa por trás do Ubuntu. Ele permite que os desenvolvedores empacotem aplicativos juntamente com suas dependências em um único arquivo, chamado de "Snap", que pode ser distribuído e instalado em diferentes distribuições Linux.

O Snap é uma tecnologia de empacotamento de aplicativos que visa resolver alguns dos desafios associados à distribuição de software em Linux. Ele oferece algumas vantagens sobre os métodos de empacotamento tradicionais, como:

1. **Confinamento de aplicativos:** os Snaps são empacotados com todas as suas dependências e são executados em um ambiente isolado, o que significa que não interferem com outros aplicativos ou o sistema operacional. Isso ajuda a garantir que os aplicativos permaneçam estáveis e seguros
2. **Atualizações automáticas:** os Snaps podem ser configurados para atualizar automaticamente para novas versões assim que estiverem disponíveis, garantindo que os usuários tenham sempre a versão mais recente do software
3. **Compatibilidade entre distribuições:** os Snaps podem ser instalados em diferentes distribuições Linux que suportam a tecnologia Snap, o que simplifica a distribuição de aplicativos e torna mais fácil para os desenvolvedores alcançarem um grande número de usuários
4. **Segurança:** devido ao seu ambiente de execução isolado, os Snaps são considerados mais seguros em comparação com aplicativos tradicionais, pois reduzem o impacto de vulnerabilidades de segurança

Em resumo, o Snap é uma tecnologia que visa simplificar a distribuição e o gerenciamento de aplicativos em Linux, fornecendo uma maneira fácil de empacotar, distribuir e manter aplicativos.

# <a id="glibc"></a>GLIBC

GLIBC (GNU C Libray) é uma biblioteca de rotinas essenciais para a execução de programas em sistemas operacionais baseados em Linux. É uma parte fundamental do ambiente de execução de muitos programas e fornece funções essenciais, como operações de entrada/saída, manipulação de strings, alocação de memória dinâmica, gerenciamento de processos, entre outras.

A GLIBC é desenvolvida pelo Projeto GNU e é distribuída sob a Licença Pública Geral GNU (GNU GPL). Ela é amplamente utilizada em sistemas operacionais baseados em Linux, incluindo distribuições populares como Ubuntu, Fedora e CentOS.

Além de fornecer funcionalidades básicas para a execução de programas, a GLIBC também implementa interfaces do sistema operacional padrão do Linux (chamadas de sistema), permitindo que os programas interajam com o kernel do sistema operacional para realizar operações como acesso a arquivos, comunicação em rede, gerenciamento de processos, entre outras.

Como uma biblioteca compartilhada, a GLIBC é essencial para o funcionamento de muitos programas em sistemas Linux, e é frequentemente atualizada para fornecer melhorias de desempenho, correções de bugs e suporte a novas funcionalidades do kernel.