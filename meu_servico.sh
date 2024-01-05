#!/usr/bin/bash

# Iniciar o Google Chrome.
google-chrome &

# Aguardar alguns segundos para garantir que o Chrome tenha tempo de iniciar.
sleep 5

# Iniciar o Tilix.
tilix &

sleep 5

# Iniciar o VSCode.
code &

sleep 5

# Iniciar o Discord.
discord &

# Desinstalar o xdotool e o wmctrl
# Abrir o VSCode de acordo com o diretório
# Quero que o Discord fique sendo executado somente em segundo plano