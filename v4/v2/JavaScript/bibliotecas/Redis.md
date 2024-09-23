# Redis

### Sumário

- [Contexto: SO Utilizado](#contexto-so-utilizado)
- [Erros Enfrentados](#erros-enfrentados)

# <a id="contexto-so-utilizado"></a>Contexto: SO Utilizado

```bash
No LSB modules are available.
Distributor ID:	Ubuntu
Description:	Ubuntu 22.04.4 LTS
Release:	22.04
Codename:	jammy
```

# <a id="erros-enfrentados"></a>Erros Enfrentados

### Sumário

- [`Error: ERR AUTH <password>`](#error-err-auth-password)

## <a id="error-err-auth-password"></a>`Error: ERR AUTH <password>`

`called without any password configured for the default user. Are you sure your configuration is correct?`

Este erro indica que você está tentando executar um comando que requer autenticação no Redis, mas não há nenhuma senha configurada para o usuário padrão.

Se você ainda não configurou uma senha ou deseja reconfigurá-la, você pode fazer isso editando o arquivo de configuração do Redis (geralmente **/etc/redis/redis.conf**) e definindo a senha. Localize a linha que começa com `requirepass`, se não existir, você pode adicioná-la ao arquivo de configuração:

```Bash
requirepass $< senha >
```

Após a edição do arquivo, reinicie o servidor Redis para aplicar as alterações, `systemctl restart redis-server`. Depois de configurar a senha, você precisará fornecê-la ao se conectar ao Redis ou ao executar comandos que requerem autenticação, por exemplo, `redis-cli -a $< senha >`.