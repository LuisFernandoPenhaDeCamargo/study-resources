#!/usr/bin/bash

# Iniciar o Google Chrome.
google-chrome &

# Aguardar alguns segundos para garantir que o Chrome tenha tempo de iniciar.
sleep 1

# Iniciar o Tilix.
tilix --maximize &

sleep 1

# Iniciar o VSCode.
code /home/orion/study-resources/ &

sleep 1

# Iniciar o Discord.
discord &

# Desinstalar o xdotool e o wmctrl
# Abrir o VSCode de acordo com o diretório
# Abrir o chrome em uma aba especifica
# Quero que o Discord fique sendo executado somente em segundo plano (fechar a janela)