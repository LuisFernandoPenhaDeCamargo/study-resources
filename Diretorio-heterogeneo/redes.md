# Redes

### Sumário

- [Interfaces de Rede](#interfaces-rede)
- [Requisições de Outra Máquina Para Um Localhost](#requisições-outra-maquina-localhost)

# <a id="interfaces-rede"></a>Interfaces de Rede

Interfaces comuns:

- **Ethernet (cabo):** se a máquina está conectada a uma rede via cabo Ethernet, provavelmente você estará usando a interface "eth0" ou similar
- **Wi-Fi:** se a máquina estiver conectada via Wi-Fi, a interface pode ser algo como "wlan0"

# <a id="requisições-outra-maquina-localhost"></a>Requisições de Outra Máquina Para Um Localhost

Considerando o framework Express de JavaScript, avalie o seguinte cenário:

Há um servidor Express configurado para ouvir apenas em "localhost" e ainda assim uma máquina externa conseguir fazer requisições para ele, isso geralmente indica que há algum tipo de redirecionamento ou proxy que está permitindo o acesso externo. Aqui estão algumas possibilidades para esse cenário:

1. **Redirecionamento de porta ou NAT (Network Address Translation):** se as máquinas estão em uma rede local (LAN) e uma delas está configurada para redirecionar certas portas para o servidor Express, isso poderia permitir que solicitações de fora chegassem ao servidor como se estivessem vindo de "localhost". Por exemplo, uma configuração no roteador ou firewall que redirecionar a porta 3000 do endereço IP externo para o endereço 127.0.01:3000 no servidor
2. **Proxy reverso:** se há um proxy reverso (como Nginx ou Apache) configurado na mesma máquina configurado na mesma máquina ou em outra máquina na rede, ele pode aceitar conexões externas e, então, repassá-las ao servidor Express como se fossem locais. O proxy ouve em um endereço de IP acessível e encaminha as requisições para localhost
3. **Configuração de rede específica:** em alguns ambientes, especialmente em ambientes corporativos ou educacionais, pode haver configurações de rede específicas que fazem com que requisições de outras máquinas pareçam vir de localhost devido políticas de segurança, configurações VPN, ou outros métodos de encaminhamento de rede

Para investigar o cenário e entender como isso funciona, você pode fazer o seguinte:

- Investigue a configuração de rede, examine as configurações de rede, regras de firewall e qualquer possível redirecionamento de porta ou configuração de proxy que possa estar afetando como as requisições são encaminhadas para o servidor
- Utilize logs no servidor e ferramentas de monitoramento de rede para ver de onde as conexões estão vindo e como estão sendo encaminhadas para o servidor

Essas ações devem ajudá-lo a entender como as conexões externas estão conseguindo alcançar um servidor configurado para ouvir apenas em localhost.