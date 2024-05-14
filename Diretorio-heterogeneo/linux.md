# Linux

### Sumário

- [GLIBC](#glib)
- [Sistema Hierárquico de Arquivos](#sistema-hierarquico-arquivos)
    + [/proc](#sistema-hierarquico-arquivos-proc)

# <a id="glibc"></a>GLIBC

GLIBC (GNU C Libray) é uma biblioteca de rotinas essenciais para a execução de programas em sistemas operacionais baseados em Linux. É uma parte fundamental do ambiente de execução de muitos programas e fornece funções essenciais, como operações de entrada/saída, manipulação de strings, alocação de memória dinâmica, gerenciamento de processos, entre outras.

A GLIBC é desenvolvida pelo Projeto GNU e é distribuída sob a Licença Pública Geral GNU (GNU GPL). Ela é amplamente utilizada em sistemas operacionais baseados em Linux, incluindo distribuições populares como Ubuntu, Fedora e CentOS.

Além de fornecer funcionalidades básicas para a execução de programas, a GLIBC também implementa interfaces do sistema operacional padrão do Linux (chamadas de sistema), permitindo que os programas interajam com o kernel do sistema operacional para realizar operações como acesso a arquivos, comunicação em rede, gerenciamento de processos, entre outras.

Como uma biblioteca compartilhada, a GLIBC é essencial para o funcionamento de muitos programas em sistemas Linux, e é frequentemente atualizada para fornecer melhorias de desempenho, correções de bugs e suporte a novas funcionalidades do kernel.

# <a id="sistema-hierarquico-arquivos"></a>Sistema Hierárquico de Arquivos

### Sumário

- [/proc](#sistema-hierarquico-arquivos-proc)

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