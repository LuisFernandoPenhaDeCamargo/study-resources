<a name = "git"></a>
### Comandos

`git clone URL_do_repositório`**:** clona um repositório remoto.\
Isso criará uma cópia local do repositório remoto no diretório atual. Se você deseja clonar o repositório remoto em um diretório específico, você pode fornecer o caminhho desejado como o segundo argumento `git clone URL_do_repositório caminho_do_diretório`.\
**Clonagem de repositórios remotos privados.**
Ao tentar clonar um repositório remoto privado em uma máquina que não é a minha, me foi pedido o "Username" e o "Password", tendo inserido essas informações, as seguintes mensagems foram recebidas:

- "`remote: Support for password authentication was removed on August 13, 2021.`"
- "`remote: Please see https://docs.github.com/en/get-started/getting-started-with-git/about-remote-repositories#cloning-with-https-urls for information on currently recommended modes of authentication.`" (há a documentação em português)
- "`fatal: Authentication failed for URL_do_repositório_privado`"

O ponto em questão é que em minha máquina está configurado a autenticação através do GitHub CLI (muitas vezes abreviado como "gh"). Ele fornece uma maneira conveniente de autenticação e gerenciamento de credenciais. Pode usar token de acesso pessoal, HTTPS ou outros métodos. O gh gerencia credenciais e automatiza o processo de autenticação.

O comando `gh auth status` exibe quem está logado no GitHub, como as operações Git estão configuradas e o Token de autenticação que está representado por asteriscos.

---

`git pull origin seu_branch`**:** atualiza o repositório local.\
Se você estiver no branch principal (geralmente chamdo de "main" ou "master"), pode usar o comando mais simples `git pull origin main`. Isso assume que o repositório remoto é chamado "origin" e o branch principal é chamado "main".\
O `git pull` realiza duas operações em conjunto: ele faz o `git fetch`, que obtém as alterações do repositório remoto, e em seguinda realiza o `git merge`, que incorpora essas alterações ao seu branch local.\
Lembre-se de que antes de realizar um `git pull`, é sempre uma boa prática garantir que não há alterações não confirmadas no seu branch local para evitar possíveis conflitos. Se houver alterações não confirmadas, você pode confirmá-las ou descartá-las antes de realizar o `git pull`.

`git pull origin main`
`git pull -f`
`git pull --force`
`git checkout -- README.md` (descartar alterações)

---