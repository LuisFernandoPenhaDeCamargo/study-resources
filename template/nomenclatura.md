# Nomenclatura

- A decisão de usar uma abreviação ou não depende da minha dificuldade em lembrar o seu significado
- **Diretórios:** o nome dos diretórios deve indicar o caminho relativo para eles e incluir a barra no final
- **Diretórios e arquivos:** para nomes compostos por mais de uma palavra, usarei um traço para separá-las (em vez de usar a convenção Camel Case)

# Diretórios e Arquivos

No Ubuntu, assim como na maioria dos SOs baseados em Unix, não há um padrão estrito para a sintaxe de nomes de diretórios (ou para a sintaxe de nomes de arquivos), mas existem algumas convenções e boas práticas recomendadas para evitar problemas e garantir a compatibilidade. Aqui estão algumas diretrizes importantes:

1. **Caracteres permitidos:**
    - Podem ser usados letras (maiúsculas e minúsculas), números e os caracteres especiais hífen, sublinhado e ponto
    - É permitido o uso de espaços, embora não seja recomendado, pois podem complicar a utilização em comandos de terminal
2. **Caracteres não recomendados:** evite usar caracteres especiais, eles têm significados especiais no shell e podem causar comportamentos inesperados
3. **Comprimento do nome:** o comprimento máximo para um nome de diretório (ou arquivo) é geralmente 255 caracteres
4. **Case sensitivity:** os nomes de diretórios (ou arquivos) são sensíveis a maiúsculas e minúsculas
5. **Pontos no nome:** use apenas um ponto para separar o nome do **arquivo** da sua extensão. Evite múltiplos pontos no nome do arquivo para evitar confusões, especialmente com sistemas que podem interpretar múltiplos pontos de maneira diferente
6. **Extensões de arquivo:**
    - Use extensões apropriadas para indicar o tipo de arquivo, como **.txt**, **.jpg**, **.pdf**, **.sh**, etc.
    - Mantenha a extensão separada do nome principal por um ponto

# Boas Práticas

- **Use nomes descritivos:** escolha nomes que descrevam claramente o conteúdo do diretório (ou arquivo)
- **Use separadores consistentes:** se precisar usar separadores, escolha entre hífen ou sublinhado e seja consistente
- **Evite espaços:** substitua espaços por hífens ou sublinhados para evitar a necessidade de escapes no terminal
- **Mantenha a simplicidade:** evite nomes excessivamente longos e complexos
- **Use extensões apropriadas:** sempre inclua a extensão apropriada para o tipo do arquivo

# Conclusão

Seguir essas diretrizes ajudará a evitar problemas de compatibilidade e facilitará o trabalho com o terminal e scripts automatizados.

# [[Próximo tópico: Tópicos]](./topicos.md)