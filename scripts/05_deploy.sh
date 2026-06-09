#!/bin/bash

LOG="/app/logs/deploy.log"

mkdir -p /app/logs

echo "======================" >> "$LOG"
echo "$(date)" >> "$LOG"

echo "Instalando dependências..." | tee -a "$LOG"

cd /app

npm install >> "$LOG" 2>&1

echo "Encerrando Node antigo..." | tee -a "$LOG"

pkill node 2>/dev/null

echo "Subindo aplicação..." | tee -a "$LOG"

nohup node server.js >> "$LOG" 2>&1 &

sleep 5

if pgrep node > /dev/null
then
    echo "Deploy realizado com sucesso" | tee -a "$LOG"
else
    echo "Falha no deploy" | tee -a "$LOG"
fi