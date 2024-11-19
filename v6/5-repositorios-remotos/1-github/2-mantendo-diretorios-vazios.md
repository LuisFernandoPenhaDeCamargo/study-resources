# Mantendo Diretórios Vazios

O Git não adiciona diretórios vazios ao repositório, pois ele só rastreia arquivos. Diretórios sem arquivos são ignorados automaticamente, mesmo que você faça o commit.

Se você precisa que um diretório vazio esteja presente no repositório, uma prática comum é adicionar um arquivo vazio, geralmente chamado de **.gitkeep**, dentro do diretório. Isso força o Git a rastrear o diretório.

# Exemplos

### 1. Exemplo de uso do .gitkeep

1. **Crie o arquivo:** dentro do diretório vazio, crie o arquivo **.gitkeep**

```Bash
$ touch directory/path/.gitkeep
```

2. **Commit e push:** em seguida, adicione o arquivo ao commit e faça o push

```Bash
$ git add directory/path/.gitkeep
$ git commit -m 'keeping empty directory with .gitkeep'
$ git push origin main
```

Assim, o diretório será adicionado ao repositório e ficará visível no GitHub.

# [[ Voltar para: GitHub ]](./1-github.md)