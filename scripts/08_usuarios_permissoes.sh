#!/bin/bash

GRUPO="campusops_ops"
USUARIO="campusops_user"

groupadd -f $GRUPO

id $USUARIO >/dev/null 2>&1 || useradd -m $USUARIO

mkdir -p /app/campusops

chown -R $USUARIO:$GRUPO /app/campusops

chmod -R 750 /app/campusops

echo "Usuário configurado"
echo "Grupo configurado"