# `path`

O `path` é um módulo nativo do Node.js que fornece **utilitários para trabalhar com caminhos de arquivos e diretórios**. Ele facilita a manipulação de caminhos de uma maneira que é independente do sistema operacional, o que é útil para garantir que o código funcione corretamente em diferentes plataformas (por exemplo, Windows, Linux, macOS).

# Benefícios

- **Independência de plataforma:** o módulo `path` é projetado para funcionar de maneira consistente em diferentes sistemas operacionais, ajustando automaticamente as barras (`/` vs `\`) e outros detalhes específicos do sistema
- **Segurança:** ao lidar com caminhos fornecidos por usuários ou fontes não confiáveis, o uso de funções como `path.resolve` pode ajudar a evitar problemas de segurança relacionados a caminhos absolutos ou relativos

O módulo `path` é fundamental para quase qualquer aplicativo Node.js que manipule arquivos e diretórios, oferecendo uma API poderosa e fácil de usar para trabalhar com caminhos de arquivos.

### Sumário

- [`join`](#join)
- [`dirname`](#dirname)

# <a id="join">`join`</a>

O método `join` é utilizado para **unir vários segmentos de caminho em um único caminho, garantindo que as separações entre diretórios sejam corretamente aplicadas, independentemente do sistema operacional**. Isso é especialmente útil quando se deseja construir caminhos de arquivos ou diretórios de forma segura e portátil.

### Sintaxe Básica

```JavaScript
path.join(...paths);
```

- `...paths` **(strings):** segmentos de caminhos que serão unidos
- **Retorno (string):** o caminho resultante após a união dos segmentos

## Exemplo

```JavaScript
import path from "path";

const directory    = "home";
const subdirectory = "user";
const filename     = "file.txt";
const fullPath     = path.join(directory, subdirectory, filname);

console.log(fullPath);
/*
Output:
home/user/file.txt (em um sistema Unix).
home\user\file.txt (em um sistema Windows).
*/
```

## Observações

- `join`**:** também resolve automaticamente duplicações de separadores e lida com segmentos como `..` (para voltar um diretório) e `.` (para se referir ao diretório atual)
- Se um segmento inicial contiver um caminho absolut, `join` ignorará os segmentos anteriores e construirá o caminho a partir do segmento absoluto

# <a id="dirname">`dirname`</a>

O método `dirname` é utilizado para **retornar o diretório pai de um caminho de arquivo fornecido**.

```JavaScript
path.dirname(p);
```

- `p`**:** o caminho de arquivo (string) do qual você deseja obter o diretório pai
- **Retorno:** retorna uma string que representa o caminho do diretório pai do arquivo especificado

## Exemplo

```JavaScript
import path from "path";

const filePath      = "/home/user/project/file.txt";
const directoryPath = path.dirname(filePath);

console.log(directoryPath); // Output: /home/user/project
```