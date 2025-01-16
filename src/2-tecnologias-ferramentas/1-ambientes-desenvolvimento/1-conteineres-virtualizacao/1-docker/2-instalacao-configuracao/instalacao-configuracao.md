# 2️⃣ Instalação e Configuração

> **Nota:** Os tópicos a seguir abordam a instalação e configuração do Docker em sistemas operacionais baseados em Linux que utilizam systemd como sistema de inicialização e gerenciamento de serviços. Se você estiver usando um sistema diferente, como macOS, Windows, ou distribuições Linux com outro gerenciador de serviços (ex: init.d), ajustes específicos podem ser necessários.

## Sumário

- [Como Instalar o Docker (Linux)](./1-como-instalar-docker.md)
- [Configuração Inicial do Docker (Permissões de Usuário, Grupos, etc.)](./2-configuracao-inicial-docker.md)
- [Compreensão do Arquivo de Configuração **daemon.json**](./3-compreensao-arquivo-configuracao-daemon-json.md)

## [ Voltar para: Docker ](../docker.md)

Eu não entendi os seus pontos sobre quando usar VMs. Eu posso usar conteinêres que possuem diferentes sistemas operacionas, não? E eles já não estão isolados? Porque aplicações monolíticas devem usar VMs?

**🧠 Modelo Utilizado: GPT-4-turbo**

---

Você levantou pontos importantes que merecem um esclarecimento mais detalhado. Vamos analisar cada um deles:  

---

### 1️⃣ **Contêineres podem ter diferentes sistemas operacionais?**  
Sim, **contêineres podem executar aplicações baseadas em diferentes sistemas operacionais**, mas isso está limitado ao kernel do sistema operacional do host.  

- **Explicação:**  
  - Em ambientes baseados em **Linux**, um contêiner só pode rodar distribuições que utilizem o kernel Linux (exemplo: Ubuntu, Alpine, CentOS).  
  - Já em ambientes **Windows**, contêineres só podem usar versões baseadas no kernel Windows.  

Diferente das VMs, que simulam hardware completo e permitem rodar **qualquer sistema operacional** (Windows, Linux, macOS, etc.), os contêineres compartilham o kernel do host e, por isso, possuem limitações.  

- **Exemplo:**  
  - Não é possível rodar um contêiner Linux em um host Windows diretamente (e vice-versa) sem ferramentas de virtualização adicionais, como WSL ou Hyper-V.

---

### 2️⃣ **Os contêineres não estão isolados?**
Sim, contêineres oferecem isolamento, mas esse isolamento ocorre no nível **lógico**, e não no nível completo de hardware como em máquinas virtuais.  

- **Diferenciais de Isolamento:**  
  - Contêineres: Compartilham recursos do host, como o kernel do sistema operacional, mas têm processos, rede e sistema de arquivos isolados.  
  - VMs: Oferecem isolamento completo, simulando hardware separado para cada máquina virtual, com sistemas operacionais independentes.  

- **Cenários em que VMs são preferidas:**  
  - Quando a segurança e o isolamento total entre aplicações são absolutamente críticos, como em ambientes de multi-tenancy (vários clientes em um mesmo servidor).  
  - Em situações onde é necessário evitar qualquer tipo de impacto entre sistemas (por exemplo, ataques que exploram vulnerabilidades no kernel do SO).

---

### 3️⃣ **Por que aplicações monolíticas podem preferir VMs?**
Você está certo em questionar isso, já que **aplicações monolíticas também podem ser executadas em contêineres**. A escolha por VMs está mais relacionada a **cenários específicos**, como:  

- **Aplicações que demandam muitos recursos:**  
  - Em alguns casos, grandes monolitos podem consumir tanto poder computacional que todo o hardware é alocado exclusivamente para essa aplicação.  
  - VMs podem oferecer maior controle sobre recursos dedicados para esse tipo de carga de trabalho.  

- **Complexidade ou legado:**  
  - Muitos sistemas monolíticos são **antigos** e foram projetados para ambientes onde VMs eram a única opção de virtualização. Adaptá-los para contêineres pode exigir reengenharia, o que nem sempre é viável.  

- **Ambientes de produção antigos:**  
  - Alguns datacenters utilizam apenas infraestrutura baseada em VMs, tornando-as a escolha natural para sistemas monolíticos legados.

---

### **Atualização: Quando Usar VMs ou Contêineres**
Dado o esclarecimento, a tabela pode ser revisada para refletir melhor as diferenças:  

#### **Use VMs Quando:**
- É necessário rodar **diferentes sistemas operacionais** no mesmo hardware.  
- Requer **isolamento completo**, como em ambientes multi-tenancy altamente críticos.  
- Está lidando com **aplicações legadas** ou monolíticas em ambientes antigos, onde migrar para contêineres seria muito complexo.  
- Precisa de total controle sobre recursos de hardware dedicados para cargas específicas.  

#### **Use Contêineres Quando:**
- Quer rodar aplicações modernas, distribuídas ou **baseadas em microserviços**.  
- Precisa de **velocidade** e **eficiência de recursos**.  
- Busca uma solução leve para **desenvolvimento, teste ou deploy** em ambientes consistentes.  
- Trabalha com pipelines de CI/CD e precisa de ambientes de teste e deploy rápidos e consistentes.

---

Se houver mais dúvidas ou outros pontos a ajustar, é só dizer! 😊

# ---

Template:

- Contexto: Documento de um tópico.
- Regra: Emojis só serão usados em subtópicos do tópico ou para enumerar subtópicos de subtópicos

em itens, letras maiúsculas após os dois pontos
os dois pontos também devem estar em negrito
só tem um #, então quando o tópico for do ##, usar ###
em tabelas, formate o espaçamento no markdown para que seja fácil de ler
rolê do negrito em nomes de arquivos e diretórios

markdown - bloco de código aceita indentação sob lista feita com traço, com numeração nop

**🧠 Modelo Utilizado: GPT-4-turbo**

---

No formato de títulos em que se utilizam **maiúsculas nas palavras principais**, algumas palavras geralmente **não começam com letra maiúscula**, salvo quando são a primeira palavra do título. Isso segue o estilo conhecido como **Title Case**, amplamente utilizado em inglês e também adaptável para o português. As palavras que **não** começam com letra maiúscula incluem:

### 1️⃣ **Preposições**  
- de, do, da  
- em, no, na  
- por, pelo, pela  
- com  
- entre  
- sobre  

### 2️⃣ **Conjunções**  
- e  
- ou  
- mas  
- porém  

### 3️⃣ **Artigos**  
- o, a, os, as  
- um, uma, uns, umas  

---

### **Exemplos Práticos em Português**  
1. **Correto**: "O que são Imagens e Contêineres (Conceito Geral)"  
2. **Errado**: "O Que São Imagens E Contêineres (Conceito Geral)"  

Aqui, **"e"** e **"são"** permanecem em minúscula porque são palavras funcionais.  

---

### **Regras Gerais em Títulos (Resumido)**  
- Palavras principais (substantivos, verbos, adjetivos e advérbios) devem começar com maiúscula.  
- Palavras funcionais (preposições, conjunções, artigos) geralmente ficam em minúscula, exceto no início do título.  

Se precisar de exemplos específicos ou de uma análise mais detalhada para outro idioma ou contexto, é só avisar! 😊