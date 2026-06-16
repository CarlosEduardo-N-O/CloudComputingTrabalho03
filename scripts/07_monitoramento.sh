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

ps aux | grep postgres | grep -v grep

echo
echo "Servidor Node.js:"

if pgrep -f "node server.js" > /dev/null
then
    echo "[OK] Servidor Node.js em execução"
else
    echo "[ALERTA] Servidor Node.js parado"
fi

echo
echo "Coleta realizada em:"
date