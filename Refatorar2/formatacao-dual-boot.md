# Guia de Formatação do Sistema Operacional

O propósito deste guia é ajudar a solucionar os problemas encontrados ao formatar o seu Sistema Operacional para que ele possa realizar um **dual boot do Windows 11 e do Ubuntu**.

O maior problema foi que ao tentar instalar o Ubuntu, o Windows já estava instalado, ele não aceita que o **Modo Sata** funcione com **Raid**. É importante pontuar que a marca do notebook é Dell e o modelo é o Acer Nitro 5. Processador Intel.

**Visão Geral**

A tecnologia de nome **Intel Rapid Storage Technology (RST)** é uma solução implementada em chips da Intel, em plataformas que suportam a RST e tem ela habilitada na BIOs do computador. Esta tecnologia permite que usuários agrupem e gerenciem vários discos rígidos como um único volume, essa funcionalidade é conhecida como **Redundant Array of Independent Disks (RAID)**.

No caso do notebook em questão, o modo sata dele estava configurado como **"entrar na Bios para verificar"**, para conseguirmos instalar o Ubuntu, nos tivemos que mudar o modo sata para **AHCI**.

Atualmente, se quisermos utilizar o Ubuntu, temos que configurar o modo sata como AHCI. Se quisermos utilizar o Windows, temos que configurar o modo sata como . Futuramente quero configurar o sistema de uma forma que eu não precise ficar alterando o modo sata.

### Sumário

- [Acessando a BIOs](#acessando-bios)
- [Acessando o "qual é o nome deste modo"](#)
- [Problema para Desativar o Modo de Segurança](#problema-desativar-modo-segurança)
- [Problema para Realizar o Boot de Um HD Externo](#problema-realizar-boot-hd-externo)
- [Problema ao Mudar o Modo Sata](#problema-mudar-modo-sata)
- [Ubuntu](#ubuntu)
    - [Configuração do Teclado](#configuração-teclado)
    - [Configuração do Idioma do Google Chrome](#configuração-idioma-google-chrome)
    - ["Static Noise When Not Playing Sounds"](#static-noise-when-not-playing-sounds)
    - [Programas Instalados](#programas-instalados)

## <a id="acessando-bios"></a>Acessando a BIOs

Aperte `F2` antes da inicialização do Sistema Operacional.

## <a id=""></a>Acessando o "qual é o nome deste modo"

## <a id="problema-desativar-modo-segurança"></a>Problema para Desativar o Modo de Segurança

## <a id="problema-realizar-boot-hd-externo"></a>Problema para Realizar o Boot de Um HD Externo

## <a id="problema-mudar-modo-sata"></a>Problema ao Mudar o Modo Sata

Na Bios, aperte as teclas `Ctrl + S` para que a opção de configuração do modo sata apareça.

## <a id = "ubuntu"></a>Ubuntu

### <a id="configuração-teclado"></a>Configuração do Teclado

O formato "ABNT2" no Windows, é o equivalente ao "Português (Brasil)" no Ubuntu.

### <a id="configuração-idioma-google-chrome"></a>Configuração do Idioma do Google Chrome

O Chrome utiliza o idioma do Ubuntu como o idioma da sua configuração. Se você quiser que a configuração do Chrome apareça em português, você deve configurar o seu Sistema Operacional para utilizar o idioma em portuguẽs.

Para instala-lo, você utiliza o comando `sudo apt install language-pack-pt`.

### <a id = "#static-noise-when-not-playing-sounds"></a>"Static Noise When Not Playing Sounds"

No meu caso, quando o fone de ouvido estava conectado, mas não havia nenhum áudio sendo reproduzido, um som de estática ficava sendo emitido. Neste caso era por conta de uma configuração de economia de energia da distribuição Linux em questão.

Em algumas distribuições, o modo de economia de energia é habilitado em todos os periféricos por padrão para conservar a bateria do notebook e de outros sistemas dependentes de bateria. Enquanto isso não afeta o desempenho do sistema, pode haver efeitos colaterais, um bom exemplo é o mal funcionamento do dispositivo de áudio.

**"Disable Power Saving Mode in snd_hda_intel"**

Para verificar se a economia de energia está habilitada, verifique a saída do comando

```bash
cat /sys/module/snd_hda_intel/parameters/power_save
```

Se a saída for `1`, o modo de economia de energia está habilitado e deve ser desativado. Para fazer isso você deve executar o comando

```bash
echo 0 > /sys/module/snd_hda_intel/parameters/power_save
```

Observe que você provavelmente precisará de permissões de super usuário para executar o comando acima.

### <a id="programas-instalados"></a>Programas Instalados

Aqui eu estou mantendo uma lista dos programas que eu utilizo e a ordem na qual eu os instalei, do primeio ao último. Antes de mais nada eu atualizei o `apt` (`sudo apt update`).

- `wget`
- **Google Chrome:** utilize o `wget` para obter o **.deb** e o instale com `dpkg`
- **Git:** `sudo apt install git`
- **VS Code:** foi um processo um pouco mais extenso, o pesquise no GPT
- **Discord:** `sudo snap install discord`
- **Rust:** ocorreu um erro ao tentar instalá-lo no Ubuntu 22.04 (jammy). Tivemos que instalar o `curl` pelo `apt` para conseguir instala-lo (também foi necessário especificar o pwd do curl "`/usr/bin/curl comando`")
    + `gcc`**:** instale o compilador C, se necessário