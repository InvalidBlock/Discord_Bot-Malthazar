#!/bin/bash

# =========================================================================================
# Nome: Arquivo de Inicialização do Discord Bot (Linux)
# =========================================================================================
# Descrição: Esse arquivo é para caso você queira que sempre execute o bot ao ligar o pc.
# Estou disponibilizando, pois guardo ele na mesma pasta do projeto, então ele está sendo
# versionado e enviado para o GitHub. Ele é opcional e muitas das vezes pode depender do
# seu Sistema Operacional e WM, leia a seguir o adendo 1. que menciono o meu OS, Kernel e
# WM que usei para executar o arquivo.
# =========================================================================================
# ------------------------------------ ADENDOS --------------------------------------------
# =========================================================================================
# 1. Criei esse arquivo para utilizar em minha máquina, portanto ela pode não ser suportada
# dependendo da distro e WM do seu computador, para caso queira comparar, 
# no momento estou usando:
# -----------------------------------------------------------------------------------------
# Sistema Operacional: Fedora Linux 43 (Workstation Edition) x864
# Kernel: Linux 6.18.5-200.fc43.x86_64
# WM: i3 4.25 (2025-12-19) (X11)
# -----------------------------------------------------------------------------------------
# 2. Para executar esse arquivo, de a permissão de execução com o seguinte comando:
#
#    chmod +x ~/Documents/DEV/DiscordBot/Malthazar/start_bot.sh
#
# -----------------------------------------------------------------------------------------
# 3. Ao estiver usando a WM i3 é só colocar em sua config (Lembre de substituir o caminho):
#
#    exec_always --no-startup-id ~/CAMINHO_ATE_O_BOT/Malthazar/start_bot.sh
#
# -----------------------------------------------------------------------------------------
# 4. Favor não colocar neste script o TOKEN e nem arquivos sensíveis, observe que o .env
# que está encarregado de esconder e manter o TOKEN seguro é carregado localmente e
# ignorado pelo Git.
# -----------------------------------------------------------------------------------------

# Evita múltiplas instâncias ao reiniciar a WM, asism não tenta executar dois do mesmo bot ao mesmo tempo
pgrep -f main.py >/dev/null 2>&1 && exit

# Diretório do Bot, considere substituir, pois esse é o caminho que uso na minha máquina
cd ~/Documents/DEV/DiscordBot/Malthazar/

# O Bot funciona em ambiente virtual para o uso da variável de ambiente que permite não vazar o TOKEN do bot.
source venv/bin/activate      

# Comando de execução do bot, redirecionando os logs e colocando-o em background.
nohup python main.py > bot.log 2>&1 &

# Um log para saber se o bot foi iniciado
echo "Bot iniciado em background com PID $!"