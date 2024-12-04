# `url`

O `url` é um módulo nativo do Node.js que fornece **utilitários para manipulação e análise de URLs**. Ele permite que você parse, format e resolve URLs de forma programática. O módulo `url` é particularmente útil ao lidar com operações que envolvem URLs em aplicações web ou em scripts que processam links.

# Principais Funções

1. **Parsing de URLs:** converte uma string de URL em um objeto que contém informações detalhadas sobre a URL, como protocolo, host, caminho, etc
2. **Formatação de URLs:** converte um objeto de URL (gerado pelo `url.parse` ou criado manualmente) de volta em uma string de URL
3. **Resolução de URLs:** resolve uma URL relativa em relação a uma URL base
4. **Resolução de URL para caminho de arquivo:** converte um URL de arquivo (`file://`) em um caminho de arquivo de sistema
5. **Conversão de caminho de arquivo para URL:** converte um caminho de arquivo do sistema em um URL de arquivo (`file://`)

### Sumário

- [`fileURLToPath`](#fileurltopath)

# <a id="fileurltopath">`fileURLToPath`</a>

O método `fileURLToPath` é utilizado para **converter URLs de arquivos (**`file://`**) em caminhos de arquivos locais**. Isso é especialmente útil quando você está trabalhando com ESM que utilizam URLs de arquivos para referenciar caminhos de arquivos no sistema.

### Sintaxe Básica

```JavaScript
import { fileURLToPath } from "url";

const filePath = fileURLToPath(url);
```

- `url`**:** a URL do arquivo que você deseja converter em um caminho de arquivo do sistema. Esse valor deve ser uma instância do objeto `URL` ou uma string que represente um URL de arquivo
- **Retorno:** retorna o caminho de arquivo do sistema correspondente ao URL de arquivo fornecido

## Exemplo

```JavaScript
import { fileURLToPath } from "url";

// URL de arquivo.
const url      = new URL("file:///C:/path/to/file.txt");
// Convertendo URL para caminho de arquivo.
const filePath = fileURLToPath(url);

console.log(filePath); // Output: C:\path\to\file.txt (em sistemas Windows).
```