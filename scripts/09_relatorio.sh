#!/bin/bash

ARQUIVO="/app/logs/relatorio_execucao.txt"

mkdir -p /app/logs

echo "=================================" > "$ARQUIVO"
echo "RELATÓRIO SISTEMA DE INGRESSOS" >> "$ARQUIVO"
echo "=================================" >> "$ARQUIVO"

echo "" >> "$ARQUIVO"
echo "Data:" >> "$ARQUIVO"
date >> "$ARQUIVO"

echo "" >> "$ARQUIVO"
echo "Versão do Node.js:" >> "$ARQUIVO"
node -v >> "$ARQUIVO" 2>/dev/null

echo "" >> "$ARQUIVO"
echo "Versão do NPM:" >> "$ARQUIVO"
npm -v >> "$ARQUIVO" 2>/dev/null

echo "" >> "$ARQUIVO"
echo "Uso de Disco:" >> "$ARQUIVO"
df -h >> "$ARQUIVO"

echo "" >> "$ARQUIVO"
echo "Uso de Memória:" >> "$ARQUIVO"
free -h >> "$ARQUIVO"

echo "" >> "$ARQUIVO"
echo "Backups Disponíveis:" >> "$ARQUIVO"
ls -lah /app/backups >> "$ARQUIVO" 2>/dev/null

echo "" >> "$ARQUIVO"
echo "Arquivos da Aplicação:" >> "$ARQUIVO"
ls -lah /app/source >> "$ARQUIVO" 2>/dev/null

echo "" >> "$ARQUIVO"
echo "Processos Node.js:" >> "$ARQUIVO"
ps aux | grep node | grep -v grep >> "$ARQUIVO"

echo "" >> "$ARQUIVO"
echo "Processos PostgreSQL:" >> "$ARQUIVO"
ps aux | grep postgres | grep -v grep >> "$ARQUIVO"

echo "" >> "$ARQUIVO"
echo "Portas em uso:" >> "$ARQUIVO"
netstat -tulpn >> "$ARQUIVO" 2>/dev/null

echo "" >> "$ARQUIVO"
echo "Usuários do Sistema:" >> "$ARQUIVO"
cut -d: -f1 /etc/passwd >> "$ARQUIVO"

echo "" >> "$ARQUIVO"
echo "Banco de Dados:" >> "$ARQUIVO"
echo "Banco: ingressos" >> "$ARQUIVO"
echo "Usuário: admin" >> "$ARQUIVO"

echo "" >> "$ARQUIVO"
echo "Status do PostgreSQL:" >> "$ARQUIVO"
service postgresql status >> "$ARQUIVO" 2>/dev/null

echo "" >> "$ARQUIVO"
echo "=================================" >> "$ARQUIVO"
echo "FIM DO RELATÓRIO" >> "$ARQUIVO"
echo "=================================" >> "$ARQUIVO"

echo "Relatório gerado com sucesso"