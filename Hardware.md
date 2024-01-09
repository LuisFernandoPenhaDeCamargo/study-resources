# <a name = "hardware"></a> Hardware

### Placa-mãe

A placa-mãe, também conhecida como motherboard, é um componente fundamental em um computador. Ela desempenha várias funções críticas para o funcionamento do sistema. Aqui estão algumas das principais funções de uma placa-mãe:

1. **Conexão de componentes:** a placa-mãe fornece conectores e slots para conectar outros componentes essenciais do computador, como processador (CPU), memória RAM, placas de expansão (placas de vídeo, placas de som, etc.), discos rígidos, unidades SSD, e outros periféricos
2. **Comunicação entre componentes:** ela atua como o principal ponto de comunicação entre todos os componentes do sistema. Através de barramentos de dados, endereços e controle, a placa-mãe permite a troca de informações entre CPU, RAM, dispositivos de armazenamento e outros dispositivos conectados
3. **Alimentação elétrica:** a placa-mãe contém conectores para fornecer energia elétrica a diversos componentes do computador, incluindo o processador e os slots de expansão. Ela regula e distribui a energia proveniente da fonte de alimentação
4. **BIOS/UEFI:** a placa-mãe contém um chip de firmware (BIOS ou UEFI) que inicializa o sistema quando o computador é ligado. Ele realiza a verificações de hardware, inicializa o sistema operacional e fornece uma interface para configuração de hardware
5. **Entradas/Saídas (E/S):** a placa-mãe fornece portas e conectores para dispositivos de entrada e saída, como portas USB, portas de áudio, portas de rede (Ethernet), entre outros. Essas portas facilitam a conexão de periféricos e dispositivos externos
6. **Slots de expansão:** a placa-mãe oferece slots de expansão para permitir a instalação de placas adicionais, como placas de vídeo dedicadas, placas de som, placas de rede, entre outras, que podem estender as capacidades do sistema
7. **Gerenciamento térmico:** muitas placas-mãe possuem sensores de temperatura e conectores para ventoinhas, ajudando no controle térmico do sistema, evitando o superaquecimento dos componentes.

Em resumo, a placa-mãe serve como o principal circuito de interconexão e suporte para todos os componentes do computador, permitindo que eles se comuniquem e operem de maneira integrada. Ela desempenha um papel crucial na funcionalidade e desempenho geral do sistema.

### FRAM

A FRAM, ou Ferroeletric Random Access Memory (Memória de Acesso Aleatório Ferroelétrica), é um tipo de memória não volátil que combina características de memória RAM (Random Access Memory) e memória Flash. Aqui estão algumas características e aplicações da FRAM:

1. **Não volatilidade:** a FRAM é não volátil, o que significa que ela mantém os dados armazenados mesmo quando a energia é desligada. Isso a torna diferente da RAM tradicional, que perde seus dados quando a energia é removida
2. **Velocidade de escrita rápida:** uma das principais vantagens da FRAM é sua velocidade de escrita rápida. Ela é capaz de gravar dados com uma velocidade comparável à da RAM tradicional, ao contrário de algumas formas de memória não volátil, como a Flash, que tendem a ter velocidades de escrita mais lentas
3. **Ciclos de gravação ilimitados:** a FRAM não tem o mesmo limite de ciclos de gravação que a memória Flash. Isso significa que você pode gravar dados na FRAM um número muito maior de vezes antes de observar desgate ou falha em comparação com tecnologias de memória não volátil mais tradicionais
4. **Baixo consumo de energia:** a FRAM geralmente consome menos energia durante operações de leitura e gravação em comparação com algumas outras tecnologias de memória não volátil, tornando-a adequada para dispositivos alimentados por bateria e aplicações de baixo consumo de energia
5. **Aplicações em sistemas embarcados:** devido à sua combinação de características rápidas, não voláteis e de baixo consumo de energia, a FRAM é frequentemente utilizada em sistemas embarcados, como microcontroladores e dispositivos IoT (Internet das Coisas). Ela é usada para armazenamento de configurações, dados temporários e outros fins em dispositivos que exigem desempenho rápido e preservação de dados em caso de falta de energia

Em resumo, a FRAM é uma tecnologia de memória que oferece a vantagem de ser não volátil, rápida e com baixo consumo de energia, tornando-a adequada para diversas aplicações em sistemas embarcados e dispositivos de baixo consumo.

### Partições x Volumes (No Contexto de Discos, Como Discos Rígidos)

Partições e Volumes não significam a mesma coisa, embora os termos muitas vezes sejam usados de forma intercambiável, eles têm significados distintos.

- **Partição:**
	+ Uma partição é uma divisão física do disco rigído
	+ Geralmente, um disco rígido pode ser dividido em várias partições, cada uma tratada 	como uma unidade separada
	+ Cada partição é tratada como uma entidade independente, com seu próprio sistema de arquivos e características
	+ Partições podem ser primárias (principal) ou estendidas/logical (lógica) em sistemas de partições MBR (Master Boot Record), ou podem ser parte de um layout GTP (Tabela de partição GUID)
- **Volume:**
	+ Um volume, por outro lado, é uma unidade lógica formada a partir de uma ou mais 	partições
	+ Um volume é uma área de armazenamento com um sistema de arquivos específico, atribuída a uma letra de unidade (por exemplo, "C:", "D:", "E:")
	+ Um volume pode abranger uma única partição ou várias partições agrupadas usando técnicas como a combinação de espaços não alocados

Em resumo, enquanto uma partição é uma divisão física do disco, um volume é uma unidade lógica formada a partir de uma ou mais partições. Em muitos casos, um volume pode ser associado a uma única partição, mas não é necessariamente a mesma coisa. Quando você cria uma partição, você geralmente formata e atribui um sistema de arquivos a ela, e isso resulta em um volume associado àquela partição.

### HD Externo x Flash Drive (Dispositivo Inicializável)

Ao realizar um processo de inicialização (boot) a partir de um sistema operacional (SO) ou utilitário em um HD externo, é necessário que o HD externo seja preparado corretamente para ser inicializado. A criação do flash drive inicializável (também conhecido como pen drive ou USB bootável) é um método comum para configurar esse processo. Aqui estão algumas razões pelas quais essa abordagem é frequentemente utilizada:

1. **Disponibilidade do SO:** o processo de criação de um flash drive inicializável geralmente envolve a instalação de um SO ou de uma ferramenta específica diretamente no dispositivo USB. Isso permite que o SO seja carregado diretamente do flash drive durante a inicialização
2. **Compatibilidade e configuração:** alguns sistemas podem não suportar inicialização diretamente de um HD externo sem a configuração adequada na BIOS/UEFI. Criar um flash drive inicializável é uma maneira de garantir que o sistema possa ser inicializado de maneira confiável e compatível em diferentes computadores
3. **Portabilidade:** ter um SO ou um utilitário em um flash drive oferece maior portabilidade. Você pode usar o mesmo flash drive para inicializar diferentes computadores, o que pode ser útil em situações de suporte técnico, recuperação de dados ou instalação de SOs
4. **Processo de instalação simples:** a criação de um flash drive inicializável muitas vezes envolve ferramentas simples e procedimentos que são mais fáceis para usuários médios seguir em comparação com outras opções

Se você está tentando inicializar a partir de um HD externo, verifique as opções de inicialização no seu BIOS/UEFI para garantir que o HD externo seja reconhecido como uma opção de inicialização. Algumas placas-mãe podem permitir inicialização direta de HDs externos, enquanto outras podem requerer configurações específicas ou a criação de um flash drive inicializável.