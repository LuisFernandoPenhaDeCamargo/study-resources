#!/usr/bin/bash

# Iniciar o Google Chrome.
google-chrome &

# Aguardar alguns segundos para garantir que o Chrome tenha tempo de iniciar.
sleep 1

# Iniciar o Tilix no diretório especificado sendo que a janela está maximizada.
tilix -w /home/orion/study-resources --maximize &

sleep 1

# Iniciar o VSCode no diretório especificado.
code /home/orion/study-resources/ &

#sleep 1

# Iniciar o Discord.
# Quando o Discord é iniciado desta forma, **aparentemente** está resultando, depois de certo tempo, em um erro.
# discord &

#: '
#'
# Anotar sobre essa estrutura de comentário de múltiplas linhas.

: '
tilix &
# - Desinstalar as ferramentas:
# - xdotool. Vou tentar utilizar por mais um tempo esta ferramenta. Eu quero conseguir interagir com um PID, porque, aparentemente, emuladores de terminais não 
#são associados a uma janela (Tilix). O Tilix acusa erros relacionado a Glib, talvez o problema relacionado a janela esteja relacionado a isso?
# - wmctrl
# - xte
# Verificar se a ferramenta "autokey-gtk" supre as minhas necessidades

# Tarefas
# - Abrir o chrome em uma aba especifica
# - Quero que o Discord fique sendo executado somente em segundo plano (fechar a janela após ele ser inicializado)

# O script abaixo abre uma "split" a direita no Tilix (ou seja, eu consigo interagir com este processo, só preciso ver como simular uma entrada de teclado nele)

tilix -w /home/orion/study-resources --maximize &

sleep 1

comando="tilix -a session-add-right"

echo $comando

# Documentar o "pgrep" e o "$"

pid=$(pgrep tilix)

echo $pid

$comando $pid &
'