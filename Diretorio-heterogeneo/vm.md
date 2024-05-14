# Virtual Machine

### Sumário

- [Observações Sobre o Sistema Operacional](#observacoes-sistema-operacional)
- [Criando uma VM](#criando-vm)

# <a id="observacoes-sistema-operacional"></a>Observações Sobre o Sistema Operacional

Sistema Operacional:

```bash
Distributor ID:	Ubuntu
Description:	Ubuntu 22.04.4 LTS
Release:	22.04
Codename:	jammy
```

# <a id="criando-vm"></a>Criando uma VM

Para criar uma máquina virtual (VM), você pode usar uma variedade de softwares de virtualização, como VirtualBox, VMware, Hyper-V, ou soluções em nuvem como AWS, Google Cloud Plataform, Azure, entre outros. Aqui está um exemplo básico de como criar uma VM usando o software de virtualização padrão do Ubuntu, o Multipass:

1. **Instale o Multipass:** o multipass é uma ferramenta de linhas de comando que permite criar, gerenciar e executar máquina virtuais no Ubuntu. Você pode instalá-lo usando o seguinte comando no terminal

```bash
$ sudo snap install multipass --classic
```

2. **Crie uma nova VM:** depois de instalar o Multipass, você pode criar uma nova VM usando o comando `multipass launch` seguido das opções desejadas. Por exemplo, para criar uma VM com o nome "my-vm" e o Ubuntu 18.04.2 LTS, você pode usar o seguinte comando

```bash
$ multipass launch --name my-vm 18.04.2
```

Não especificamos o final da versão (`.02`), pois ela não está disponível para download diretamente no Multipass. Quando uma versão não está disponível para download diretamente, o erro "`launch failed: Unable to find an image matching "18.04.2" in remote "".`" é acusado.

A versão instalada pelo comando acima é a "`18.04.6`".

3. **Acesse a VM:** uma vez criada, você pode acessar a VM usando o comando `multipass shell` seguido do nome da VM. Por exemplo

```bash
$ multipass shell my-vm
```

4. **Gerencie a VM:** você pode gerenciar a VM usando uma variedade de comandos Multipass, como iniciar, parar, reiniciar, excluir e listar as VMs. Alguns exemplos de comandos úteis incluem

```bash
$ multipass start my-vm  # Inicia a VM.
$ multipass stop my-vm   # Para a VM.
$ multipass delete my-vm # Exclui a VM.
$ multipass list         # Lista todas as VMs disponíveis.
```

5. **Instale aplicativos e configure a VM conforme necessário:** dentro da VM, você pode instalar e configurar os aplicativos desejados, assim como faria em uma máquina física

Usando o Multipass, você pode instalar e configurar os aplicativos desejados, assim como faria em uma máquina física.