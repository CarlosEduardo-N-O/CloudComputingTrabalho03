#!/bin/bash

#!/bin/bash

BACKUP_DIR="/app/backups"

mkdir -p "$BACKUP_DIR"

DATA=$(date +"%Y-%m-%d_%H-%M-%S")

export PGPASSWORD=admin

pg_dump \
    -h localhost \
    -U admin \
    -d ingressos \
    > "$BACKUP_DIR/backup_ingressos_$DATA.sql"

if [ $? -eq 0 ]; then
    echo "Backup realizado com sucesso:"
    echo "$BACKUP_DIR/backup_ingressos_$DATA.sql"
else
    echo "Erro ao realizar backup."
fi