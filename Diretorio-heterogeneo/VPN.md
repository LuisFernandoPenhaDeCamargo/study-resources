# VPN

VPN (Virtual Private Network) é uma tecnologia que estabelece uma conexão segura e criptografada entre um dispositivo (ou rede local) e um servidor remoto. Ela permite que você navegue na internet de forma segura, protegendo seus dados contra a interceptação, manipulação e acesso não autorizado.

Uma VPN cria uma espécie de "túnel" seguro através da internet, encapsulando e criptografando todos os dados que passam por ele. Isso é especialmente útil ao acessar rede públicas, como hotspots WI-FI em cafés, aeroportos ou outros locais, onde suas informações podem ser vulneráveis a ataques cibernéticos.

Além de segurança, as VPNs também podem ser usadas para acessar conteúdo restrito geograficamente, contornando bloqueios regionais em serviços de streaming, por exemplo. Elas também são comumente usadas por empresas para permitir que funcionários acessem recursos internos da empresa de forma segura enquanto estão fora do escritório.

### Sumário

- [Contexto: SO Utilizado](#contexto-so-utilizado)
- [Configurando a VPN](#configurando-vpn)

# <a id="contexto-so-utilizado"></a>Contexto: SO Utilizado

Sistema Operacional:

```bash
No LSB modules are available.
Distributor ID:	Ubuntu
Description:	Ubuntu 22.04.4 LTS
Release:	22.04
Codename:	jammy
```

# <a id="configurando-vpn"></a>Configurando a VPN

- Canto direito superior -> Configurações -> Rede -> VPN -> Importar de arquivo
- Você também pode executar o comando:

```bash
sudo openvpn $< arquivo.ovpn >
```

Observando que, normalmente, o `openvpn` já vem instalado, e que o processo precisa continuar em execução, caso contrário, a conexão com a rede é interrompida.

Se atente também que existem configurações de rede que bloqueiam a listagem de IPs ou a exibição dos hostsnames, ou seja, você não vai conseguir executar uma listagem das máquinas pelo `nmap`, por exemplo.

- A interface de rede que representa a VPN, normalmente é a "tun0", ela será listada pelo `ifconfig` se estiver ativa
- `sudo ip route add 192.168.1.0/24 via $< inet da tun0, 10.8.0.6, por exemplo >`**:**  este comando adiciona uma rota para a rede `192.168.1.0/24` com um gateway específico (`via`) de `10.8.0.6`. Isso significa que qualquer tráfego destinado à rede `192.168.1.0/24` será encaminhado pelo IP `10.8.0.6`