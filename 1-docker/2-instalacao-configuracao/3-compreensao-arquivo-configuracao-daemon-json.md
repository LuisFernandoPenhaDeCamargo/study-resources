# 3️⃣ Compreensão do Arquivo de Configuração **daemon.json**

O arquivo **daemon.json** é o principal meio de configurar o comportamento do Docker Engine. Ele permite definir opções globais para o daemon do Docker, como o local de armazenamento de dados, opções de rede, logs, entre outros.

O arquivo está localizado no diretório:

```Bash
/etc/docker/daemon.json
```

Caso o arquivo não exista, você pode criá-lo manualmente, caso deseje configurar o comportamento do Docker, garantindo que as permissões estejam corretas. Após editar e salvar o arquivo, lembre-se de reiniciar o serviço do Docker para aplicar as alterações realizadas.

É fundamental certificar-se de que o arquivo contém um JSON válido e bem formatado, pois erros de sintaxe podem impedir que o Docker seja iniciado corretamente.

## 🔧 Estrutura Básica

O arquivo utiliza o formato JSON. Um exemplo básico:

```JSON
{
  "data-root": "/var/lib/docker",
  "log-level": "info",
  "storage-driver": "overlay2",
  "bip": "192.168.1.1/24"
}
```

Cada chave representa uma configuração do Docker daemon.

## 🛠️ Principais Configurações

### 1️⃣ Localização de Dados

Define onde o Docker armazena os dados dos contêineres, imagens e volumes.

```JSON
{
  "data-root": "/novo/caminho/docker"
}
```

**Uso:** Alterar para um disco ou partição com mais espaço.

### 2️⃣ Driver de Armazenamento

Configura o driver de armazenamento usado para gerenciar os dados dos contêineres.

```JSON
{
  "storage-driver": "overlay2"
}
```

**Opções comuns:**  
  - `overlay2` (recomendado para a maioria dos casos)
  - `aufs`, `btrfs` (dependem do sistema de arquivos)

> **Nota:** Verifique a compatibilidade do driver com seu sistema operacional antes de alterar.

### 3️⃣ Nível de Logs

Configura o nível de detalhamento dos logs do Docker daemon.

```JSON
{
  "log-level": "warn"
}
```

**Opções:**  
  - `debug` – Mais detalhado
  - `info` – Informações básicas
  - `warn` – Apenas alertas
  - `error` – Apenas erros críticos

### 4️⃣ Configuração de Rede

#### a) Sub-rede Bridge (BIP)

Define o IP e a máscara de sub-rede para a bridge padrão do Docker.

```JSON
{
  "bip": "192.168.1.1/24"
}
```

**Uso:** Evitar conflitos com redes existentes.

#### b) DNS Personalizado

Configura servidores DNS que os contêineres usarão.

```JSON
{
  "dns": ["8.8.8.8", "8.8.4.4"]
}
```

#### c) Bloqueio de IPv6

Habilita ou desabilita o suporte a IPv6.

```JSON
{
  "ipv6": true
}
```

### 5️⃣ Limites de Recursos

Configura limites padrão para recursos usados por contêineres.

```JSON
{
  "default-ulimits": {
    "nofile": {
      "Name": "nofile",
      "Soft": 1024,
      "Hard": 2048
    }
  }
}
```

`nofile`**:** Limita o número de arquivos que podem ser abertos.

### 6️⃣ Configuração de Logs de Contêiner

Configura os logs padrão para os contêineres:

```JSON
{
  "log-driver": "json-file",
  "log-opts": {
    "max-size": "10m",
    "max-file": "3"
  }
}
```

- `log-driver`**:** Define o driver de logs (`json-file`, `syslog`, etc.)
- `log-opts`**:** Configurações adicionais para o driver de logs

### 7️⃣ Registro de Imagens Privadas

Permite autenticar e configurar um registro de imagens privado.

```JSON
{
  "insecure-registries": ["meu-registro-privado.com:5000"],
  "registry-mirrors": ["https://meu-mirror.com"]
}
```

- `insecure-registries`**:** Configura registros sem HTTPS
- `registry-mirrors`**:** Configura mirrors para acelerar o download de imagens

## 🔐 Segurança e Permissões

- O **daemon.json** só pode ser editado por usuários com privilégios de administrador/root
- Certifique-se de que as permissões do arquivo estejam corretas:  
  ```Bash
  $ sudo chmod 600 /etc/docker/daemon.json
  ```

## ⚙️ Aplicando Alterações

Após editar o arquivo, reinicie o daemon do Docker para aplicar as configurações:

```Bash
$ sudo systemctl restart docker
```

⚠️ **Aviso:** Um erro de sintaxe no arquivo pode impedir o Docker de iniciar. Use ferramentas como `jq` para validar o JSON antes de salvar:

```Bash
$ jq . /etc/docker/daemon.json
```

## 📚 Resumo

1. O **daemon.json** é usado para configurar o comportamento global do Docker daemon
2. Ele oferece flexibilidade para ajustes de rede, logs, armazenamento e segurança
3. Sempre valide o arquivo após modificações e reinicie o serviço para aplicar as mudanças

## [[ Voltar para: Instalação e Configuração ]](./instalacao-configuracao.md)