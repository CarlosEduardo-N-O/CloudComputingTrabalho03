#!/bin/bash

criar_estrutura() {

 
    mkdir -p /app/usuarios
    mkdir -p /app/logs
    mkdir -p /app/backups

    touch /app/usuarios/usuarios.txt

    echo "Estrutura criada com sucesso"
}

criar_estrutura

#!/bin/bash