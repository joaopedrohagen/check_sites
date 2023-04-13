#!/bin/bash

##################################################################
#----------------------------------------------------------------#
# Script Name: check_sites.sh                                    #
#----------------------------------------------------------------#
# Description: This script checks if the sites in the srv folder #
# are working through the curl command.                          #
#----------------------------------------------------------------#
# Site: https://hagen.dev.br                                     #
#----------------------------------------------------------------#
# Author: João Pedro Hagen <joaopedro@hagen.dev.br>              #
# ---------------------------------------------------------------#
# History:                                                       #
#   V1.0.1 2023-04-12                                            #
#       -Initial release.                                        #
##################################################################

# Variável que lista os diretórios dos sites com suas terminações informadas no primeiro 'grep'
# e depois exclui da lista os diretórios que contenham '.configr.cloud'
LISTA_SITES=$("ls" /srv/ | grep -E '\.(com|org|net|edu|gov|mil|info|biz|co|io|adv|dev)' | grep -v '.configr.cloud')

# Loop para pegar os sites da pasta srv e testar
for SITES in $LISTA_SITES;
do
    STATUS1=$(curl -Is "$SITES" | grep "HTTP/1.1 200 OK") 
    STATUS2=$(curl -Is "$SITES" | grep "HTTP/1.1 301 Moved Permanently")

    if [ -n "$STATUS1" -o "$STATUS2" ]; then
        echo -e "O site \e[32m$SITES\e[0m está \e[92mfuncionando\e[0m.";
    else
        echo -e "O site \e[32m$SITES\e[0m está com \e[31merro\e[0m.";
    fi
done

echo;
echo;
echo;
echo;
echo " ____   ___  ____  __  ____  ____                                    ";
echo "/ ___) / __)(  _ \(  )(  _ \(_  _)                                   ";
echo "\___ \( (__  )   / )(  ) __/  )(                                     ";
echo "(____/ \___)(__\_)(__)(__)   (__)                                    ";
echo " ____  _  _  _    _  _   __    ___  ____  __ _     ____  ____  _  _  ";
echo "(  _ \( \/ )(_)  / )( \ / _\  / __)(  __)(  ( \   (    \(  __)/ )( \ ";
echo " ) _ ( )  /  _   ) __ (/    \( (_ \ ) _) /    / _  ) D ( ) _) \ \/ / ";
echo "(____/(__/  (_)  \_)(_/\_/\_/ \___/(____)\_)__)(_)(____/(____) \__/  ";
echo;
echo;
