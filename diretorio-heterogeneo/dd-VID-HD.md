# `dd` de uma VDI para um HD

Quando você usa o `dd` para gravar uma imagem de disco (como um VDI convertido para o formato raw) em um disco rígido (HD), o processo copia os dados byte a byte da imagem diretamente para o disco de destino. Isso inclui todas as partições, tabelas de partições, sistemas de arquivos e dados contidos na imagem.

## Como o `dd` Lida com Partições e Sistemas de Arquivos

1. **Cópia byte a byte:** o `dd` não faz distinção entre dados, tabelas de partições ou metadados. Ele simplesmente copia o conteúdo da imagem de entrada para o disco de saída byte a byte, incluindo qualquer estrutura de partição e sistema de arquivos contidos na imagem
2. **Partições e tabelas de partição:**
    - Se a imagem (por exemplo, o arquivo raw resultante do VDI) contiver uma tabela de partições (como MBR ou GPT), o `dd` copiará essa tabela para o HD de destino. Isso significa que, após a cópia, o HD terá as mesmas partições que estavam na imagem original
   - As partições na imagem serão recriadas no disco de destino exatamente como estavam no disco virtual
3. **Sistemas de arquivos:** os sistemas de arquivos dentro das partições também são copiados exatamente como estavam na imagem. Isso significa que, se a imagem contiver um sistema de arquivos ext4, NTFS, FAT32, etc., ele será preservado no HD de destino
4. **Bootloader e MBR/GPT:** se a imagem original contiver um bootloader (como GRUB, MBR) ou uma tabela de partição GPT, esses também serão copiados para o HD de destino. Isso permite que o disco de destino seja inicializável, desde que o hardware suporte as configurações da imagem

## Observações

- **Tamanho do disco:** o HD de destino deve ser igual ou maior que o tamanho da imagem. Se o HD for menor, a cópia não será concluída corretamente, e pode resultar em um sistema quebrado
- **Espaço não alocado:** se o HD for maior que a imagem, o espaço restante no HD ficará não alocado, e você poderá querer redimensionar as partições para utilizar todo o espaço disponível
- **Sobrescrição completa:** o `dd` sobrescreverá completamente os dados existentes no HD de destino, incluindo a tabela de partições e todos os dados. Isso significa que qualquer dado previamente no HD será perdido
- **Alinhamento de partições:** como o `dd` faz uma cópia exata, as partições e os dados são colocados exatamente onde estavam na imagem original. Isso pode não ser ideal em todos os casos, especialmente se o alinhamento de partições não for adequado para o disco de destino, mas normalmente funciona bem para a maioria dos cenários

## Resumo

- **Cópia exata:** `dd` realiza uma cópia exata de tudo na imagem, incluindo partições, sistemas de arquivos, bootloader e dados
- **Simples e poderoso:** é uma ferramenta muito simples, mas poderosa, que faz o trabalho sem "interpretar" ou "ajustar" nada, o que significa que você obtém uma réplica fiel do disco original

Se você seguir esse procedimento, o HD de destino deve ser uma réplica funcional do disco representado pela imagem VDI, com as partições e sistemas de arquivos intactos e no lugar correto.

# Passos para Gravar um VDI em um HD usando `dd`

### 1. Converter o VDI para um formato raw (opcional)

Se o arquivo VDI não estiver em formato raw, você pode precisar convertê-lo. Ferramentas como `qemu-img` podem ser usadas para converter o VDI para um formato raw, que é necessário para ser gravado diretamente em um HD.

```bash
$qemu-img convert -O raw input.vdi output.img
```

- **`input.vdi`**: O arquivo VDI original
- **`output.img`**: O arquivo de saída no formato raw

### 2. Usar o `dd` para gravar a imagem no HD

Após converter o VDI (se necessário), você pode usar o `dd` para gravar a imagem no HD.

```bash
$sudo dd if=output.img of=/dev/sdX bs=4M status=progress
```

- **`if=output.img`**: o arquivo de imagem de entrada (formato raw ou img)
- **`of=/dev/sdX`**: o disco de destino (substitua `sdX` pelo identificador do seu HD).
- **`bs=4M`**: define o tamanho do bloco para 4 MB (pode ser ajustado conforme necessário)
- **`status=progress`**: mostra o progresso da cópia

### 3. Finalizar e verificar

Depois que o `dd` concluir a gravação, você pode montar o HD e verificar se a imagem foi gravada corretamente.

## Observações

- **Cuidado com o `of=`:** certifique-se de especificar corretamente o dispositivo de destino (`of=`) porque `dd` sobrescreverá o conteúdo do disco especificado sem aviso
- **Backup:** faça backups antes de executar operações como esta, pois `dd` é uma ferramenta poderosa que pode sobrescrever dados sem possibilidade de recuperação
- **Conversão:** se o VDI já estiver em formato raw, a conversão não será necessária, e você pode gravá-lo diretamente no HD

Essa abordagem é útil, por exemplo, para migrar uma máquina virtual para um hardware físico, transformando a imagem VDI em um sistema operacional funcionando diretamente no HD.