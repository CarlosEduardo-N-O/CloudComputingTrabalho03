#!/bin/bash

while true
do

clear

echo "==================================="
echo "     MENU DEVOPS CLOUD"
echo "==================================="
echo "Aluno: Carlos Eduardo Nogueira de Oliveira"
echo "Tema: CampusOps"
echo "==================================="
echo "1 - Atualizar sistema"
echo "2 - Instalar Node"
echo "3 - Criar estrutura"
echo "4 - Realizar backup"
echo "5 - Fazer deploy"
echo "6 - Ver processos"
echo "7 - Monitorar sistema"
echo "8 - Configurar usuários"
echo "9 - Gerar relatório"
echo "10 - Criar Banco"
echo "0 - Sair"
echo "==================================="

read -p "Escolha uma opção: " opcao

case $opcao in

1)
/app/scripts/01_update.sh
;;

2)
/app/scripts/02_node.sh
;;

3)
/app/scripts/03_estrutura.sh
;;

4)
/app/scripts/04_backup.sh
;;

5)
/app/scripts/05_deploy.sh
;;

6)
read -p "Nome do processo: " processo
/app/scripts/06_processos.sh buscar $processo
;;

7)
/app/scripts/07_monitoramento.sh
;;

8)
/app/scripts/08_usuarios_permissoes.sh
;;

9)
/app/scripts/09_relatorio.sh
;;

10)
/app/scripts/10_banco.sh
;;

0)
exit 0
;;

*)
echo "Opção inválida"
;;

esac

echo
read -p "Pressione ENTER para continuar..."

done