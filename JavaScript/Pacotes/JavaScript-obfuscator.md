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
$ javascript-obfuscator /home/$< usuário >/APIs/zoe-game-api/ --output /home/$< usuário >/APIs/obfuscated --exclude /home/$< usuário >/APIs/zoe-game-api/node_modules/
```

Isso irá ofuscar todo o conteúdo do diretório **zoe-game-api**, os arquivos ofuscados gerados serão colocados em **obfuscated**. A opção `--exclude` específica que o conteúdo do diretório **node_modules** é o único que não deve ser ofuscado **(erros ocorreram quando eu tentei obscurecer ele)**.