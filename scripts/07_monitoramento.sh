#!/bin/bash

echo "========================="
echo "Monitoramento CampusOps"
echo "========================="

echo
echo "CPU:"
top -bn1 | head -5

echo
echo "Memória:"
free -h

echo
echo "Disco:"
df -h

echo
echo "POSTGRESQL"

ps aux | grep postgres

echo
echo "Apache:"

if pgrep apache2 > /dev/null
then
    echo "[OK] Apache em execução"
else
    echo "[ALERTA] Apache parado"
fi

echo
echo "Coleta realizada em:"
date