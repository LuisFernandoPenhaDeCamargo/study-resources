# <a id="javascript-obfuscator"></a>JavaScript obfuscator

JavaScript obfuscator é um ofuscador gratuito para JavaScript, o qual possui várias features para proteger o seu código fonte. Para utilizá-lo através do CLI, você pode instalá-lo globalmente pelo npm.

**Opções Comuns**

1. `--compact`**:** habilita a compactação do código obfuscado, removendo espaços em branco e quebras de linha desnecessárias para reduzir o tamanho do arquivo
2. `--controlFlowFlattening`**:** habilita a técnica de achatamento de fluxo de controle, que torna mais difícil entender a lógica do código, substituindo estruturas de controle por estruturas equivalentes mais complexas
3. `--controlFlowFlatteningThreshold $< número >`**:** define o limite para a aplicação de técnica de achatamento de fluxo de controle. Quanto maior o valor, mais agressiva será a obfuscação
4. `--deadCodeInjection`**:** habilita a injeção de código morto, que adiciona instruções de código morto ao código obfuscado para confundir e dificultar a análise do código
5. `--deadCodeInjectionThreshold $< número >`**:** define o limite para aplicação da técnica de injeção de código morto. Quanto maior o valor, mais agressiva será a obfuscação
6. `--renameGlobals`**:** habilita a renomeação de variáveis globais, substituindo nomes de variáveis por nomes mais curtos e sem significado para tornar o código menos legível
7. `--stringArray`**:** habilita a ofuscação de literais de string, armazenando-os em um array e substituindo as ocorrências por referências a esse array
8. `--rotateStringArray`**:** habilita a rotação do array de strings, embaralhando os elementos do array para tornar mais difícil a leitura do código
9. `--splitStrings`**:** habilita a divisão de literais de string longos em partes menores para dificultar a compreensão do código

**Exemplos Interessantes**

```bash
$ javascript-obfuscator /home/$< usuário >/$< pwd do diretório de entrada >/ --output /home/$< usuário >/$< pwd para o diretório de saída >/ --exclude /home/$< usuário >/$< pwd para o diretório ou arquivo que não sera obfuscado >/node_modules
```

Isso irá ofuscar todo o conteúdo do diretório "**pwd do diretório de entrada**", os arquivos ofuscados gerados serão colocados em "**pwd para o diretório de saída**". A opção `--exclude` específica que o conteúdo do diretório **node_modules** é o único que não deve ser ofuscado **(erros ocorreram quando eu tentei obscurecer ele)**.

**Observações Interessantes**

O JavaScript obfuscator é projetado para obfuscar apenas arquivos JavaScript (**.js**) e não lida com arquivos JSON (**.json**). O obfuscador processa o código JavaScript para torná-lo mais difícil de ler e entender, mas os arquivos JSON são dados e não contêm lógica executável, portanto, não são apropriados para obfuscação.

Acho importante pontuar que na saída do processo, os arquivos **.json não estarão incluídos, assim como os arquivos pontuados na opção** `--exclude`.

---

O log do JavaScript obfuscator é muito bom, ele pontua o arquivo que está sendo obfuscado, além de indicar, em caso de erro, o arquivo no qual o erro foi gerado.

```bash
$ javascript-obfuscator /home/$< usuário >/$< pwd do diretório de entrada >/ --output /home/$< usuário >/$< pwd para o diretório de saída > --exclude /home/$< usuário >/$< pwd para o diretório ou arquivo que não sera obfuscado >/node_modules/

[javascript-obfuscator-cli] Obfuscating file: /home/$< usuário >/$< pwd do diretório de entrada >/$< diretório >/$< arquivo 1 >.js... 

[javascript-obfuscator-cli] Obfuscating file: /home/$< usuário >/$< pwd do diretório de entrada >/$< diretório >/$< arquivo 2 >.js... 

[javascript-obfuscator-cli] Error in file: /home/$< usuário >/$< pwd do diretório de entrada >/$< outro diretório >/$< arquivo 2 >.js... 

# Log do erro.
```

O caso descrito acima ocorreu comigo, o arquivo em questão ("`arquivo 2`"), possuia um erro de programação no qual uma vírgula indevida existia no final de uma linha de expressão.