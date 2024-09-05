# "só é feito DD pro HD"

A frase "só é feito DD pro HD" está se referindo ao uso do comando `dd` no Ubuntu para copiar ou clonar o conteúdo para um disco rígido (HD). O comando `dd` é uma ferramenta poderosa usada para realizar cópias byte a byte, o que é útil para criar imagens de disco, backups, ou clonagem de discos inteiros.

`dd` é um utilitário de linha de comando no Linux/Unix usado para copiar e converter dados entre arquivos, dispositivos ou partições de disco. É muito utilizado para criar cópias de segurança de discos rígidos (HDs), criar imagens de disco, ou até mesmo para gravar imagens de instalação de sistemas operacionais em pendrives ou outros dispositivos de armazenamento.

# Exemplo

```Bash
$sudo dd if=/dev/sdX of=/dev/sdY bs=4M
```

- `if`**:** define o arquivo de entrada ou dispositivo de origem (ex.: `/dev/sdX`)
- `of`**:** define o arquivo de saída ou dispositivo de destino (ex.: `/dev/sdY`)
- `bs`**:** define o tamanho do bloco (ex.: `4M` para 4 megabytes)

# [[Voltar para: Diretório Heterogêneo]](./diretorio-heterogeneo.md)