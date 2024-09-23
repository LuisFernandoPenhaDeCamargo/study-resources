# `systeminformation` (Ok)

O pacote `systeminformation` é uma biblioteca Node.js que **fornece informações detalhadas sobre o sistema operacional, hardware, e componentes de software**. É uma ferramenta poderosa e versátil para obter dados sobre o sistema, que podem ser úteis em várias aplicações, desde monitoramento de servidores até desenvolvimento de aplicações desktop.

### Sumário

- [`.diskLayout()`](#disklayout)

# <a id="disklayout"></a>`.diskLayout()`

É utilizado para **retornar informações detalhadas sobre os discos físicos no sistema, incluindo tipo, nome do dispositivo, tamanho, e vendor**. Este método é útil para obter uma visão geral dos discos físicos instalados no sistema, suas capacidades, e outras características.

```JavaScript
si.diskLayout();
```

Retorna um array de objetos, onde cada objeto representa um disco físico.

**Quando Usar**

Este método pode ser útil em várias situações, como:

- **Monitoramento de servidores:** para obter informações detalhadas sobre os discos físicos instalados em um servidor
- **Aplicações de gestão em sistemas:** para fornecer dados sobre os discos físicos em uma interface de gestão
- **Soluções de backup:** para identificar discos e planejar estratégias de backup baseadas em suas capacidades e tipos

### Propriedades Retornadas

- `device`**:** nome do dispositivo (por exemplo, `dev/sda`)
- `type`**:** tipo do disco (por exemplo, `HD` para disco rígido, `SSD` para disco de estado sólido)
- `name`**:** nome do disco
- `vendor`**:** fabricante do disco
- `size`**:** tamanho do disco em bytes
- `bytesPerSector`**:** número de bytes por setor
- `totalCylinders`**:** número total de cilindros
- `totalHeads`**:** número total de cabeças
- `totalSectors`**:** número total de setores
- `totalTracks`**:** número total de trilhas
- `tracksPerCylinder`**:** números de trilhas por cilindro
- `sectorsPerTrack`**:** número de setores por trilha
- `firmwareRevision`**:** revisão do firmware do disco
- `serialNum`**:** número de série do disco
- `interfaceType`**:** tipo de interface (por exemplo, `SATA`, `IDE`)
- `smartStatus`**:** status SMART do disco (`ok` se o disco estiver funcionando corretamente)
- `temperature`