#!/bin/bash

listar_processos() {

    echo "=========================="
    echo "PROCESSOS EM EXECUÇÃO"
    echo "=========================="

    ps aux --sort=-%cpu | head -20

    echo ""
    echo "=========================="
    echo "NODE.JS"
    echo "=========================="

    ps aux | grep node | grep -v grep

    echo ""
    echo "=========================="
    echo "POSTGRESQL"
    echo "=========================="

    ps aux | grep postgres | grep -v grep
}

buscar_processo() {

    if [ -z "$1" ]
    then
        echo "Informe o nome do processo"
        exit 1
    fi

    ps aux | grep "$1" | grep -v grep
}

matar_processo() {

    if [ -z "$1" ]
    then
        echo "Informe um PID"
        exit 1
    fi

    kill -9 "$1"

    echo "Processo $1 finalizado."
}

info_container() {

    echo "=========================="
    echo "INFORMAÇÕES DO CONTAINER"
    echo "=========================="

    echo "Hostname:"
    hostname

    echo ""
    echo "Uptime:"
    uptime

    echo ""
    echo "Uso de Memória:"
    free -h

    echo ""
    echo "Uso de Disco:"
    df -h
}

case "$1" in

listar)
    listar_processos
    ;;

buscar)
    buscar_processo "$2"
    ;;

matar)
    matar_processo "$2"
    ;;

container)
    info_container
    ;;

*)
    echo ""
    echo "Uso:"
    echo "./06_processos.sh listar"
    echo "./06_processos.sh buscar node"
    echo "./06_processos.sh buscar postgres"
    echo "./06_processos.sh matar PID"
    echo "./06_processos.sh container"
    ;;
esac