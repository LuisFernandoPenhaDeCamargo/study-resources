# Nomeação de Diretórios e Arquivos

Diretrizes específicas para nomear diretórios e arquivos, garantindo consistência e portabilidade entre diferentes sistemas de arquivos.

# Regras Gerais de Nomeação

- **Numeração para organização:** utilize numeração sequencial (ex: **1-introducao.md**) apenas se a ordem dos arquivos for necessária
- **Letras minúsculas e separadores:** os nomes devem ser em letras minúsculas, com hífens (-) como separadores. Evite espaços e caracteres especiais para facilitar o uso em múltiplos sistemas
- **Sem acentos:** evite acentuação para manter a compatibilidade entre diferentes sistemas
- **Correspondência ao nome do tópico:** o nome do diretório ou arquivo deve corresponder ao nome do tópico principal, omitindo preposições e artigos

# Diretrizes Específicas

1. **Caracteres permitidos:** utilize letras (minúsculas), números, hífen, sublinhado e ponto
2. **Não utilize caracteres especiais:** não utilize caracteres com significado especial no shell, como `@`, `$`, `%`, entre outros, para evitar comportamentos inesperados
3. **Comprimento do nome:** embora o limite geral seja 255 caracteres, opte por nomes concisos e fáceis de manipular
4. **Sensibilidade a maiúsculas e minúsculas:**  em sistemas Unix e Linux, letras maiúsculas e minúsculas diferenciam nomes de arquivos e diretórios
5. **Uso de pontos:** use um único ponto para separar o nome do arquivo de sua extensão. Múltiplos pontos podem causar interpretações incorretas pelo sistema
6. **Extenões de arquivos:** utilize extensões apropriadas para cada tipo de arquivo, como **.txt**, **.js**, **.pdf**, **.sh**, etc. Separe a extensão do nome principal com um ponto

## Funções, Métodos e Propriedades

- **Nomeação direta:** nomeie o arquivo apenas com o nome da função, método ou propriedade
- **Encadeamento:** em casos de encadeamento, inclua todas as propriedades no nome do arquivo, separando-as com o caractere underline (**_**). Exemplo: **objeto_propriedade_subpropriedade.md**

# [[ Voltar para: Diretórios e Arquivos ]](./1-diretorios-arquivos.md)