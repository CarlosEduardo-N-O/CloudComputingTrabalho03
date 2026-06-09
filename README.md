# CloudComputingTrabalho03 - Sistema de Venda de Ingressos

## Sobre o Projeto

Este projeto foi desenvolvido com o objetivo de aplicar conceitos de Computação em Nuvem, Linux, Shell Script, DevOps e desenvolvimento de aplicações web.

A aplicação consiste em um sistema simples de venda e gerenciamento de ingressos para eventos, permitindo o cadastro, consulta, atualização e exclusão de eventos através de uma API desenvolvida em Node.js e utilizando PostgreSQL como banco de dados.

Além da aplicação, o projeto possui um conjunto de scripts de automação responsáveis por configurar o ambiente Linux, instalar dependências, gerenciar usuários, realizar backups, monitorar recursos do sistema e executar o deploy da aplicação.

---

## Tecnologias Utilizadas

* Ubuntu Linux
* Shell Script (Bash)
* Node.js
* Express.js
* PostgreSQL
* Docker
* Docker Compose
* HTML
* CSS
* JavaScript

---

## Estrutura do Projeto

```text
CloudComputingTrabalho03
│
├── db
│   └── connection.js
│
├── source
│   ├── index.html
│   ├── css
│   └── js
│
├── scripts
│   ├── 01_update.sh
│   ├── 02_node.sh
│   ├── 03_estrutura.sh
│   ├── 04_backup.sh
│   ├── 05_deploy.sh
│   ├── 06_processos.sh
│   ├── 07_monitoramento.sh
│   ├── 08_usuarios_permissoes.sh
│   ├── 09_relatorio.sh
│   ├── 10_banco.sh
│   └── menu.sh
│
├── Dockerfile
├── docker-compose.yml
├── package.json
├── server.js
└── .env
```

---

## Funcionalidades

### Aplicação

* Cadastro de eventos
* Consulta de eventos
* Atualização de eventos
* Exclusão de eventos
* Persistência em banco PostgreSQL

### Automações Linux

* Atualização automática do sistema
* Instalação do Node.js
* Instalação do PostgreSQL
* Criação de estrutura de diretórios
* Backup da aplicação
* Deploy automatizado
* Monitoramento de processos
* Monitoramento de recursos da VM
* Gerenciamento de usuários e permissões
* Geração de relatórios

---

## Como Executar o Projeto

### 1. Clonar o Repositório

```bash
git clone <URL_DO_REPOSITORIO>
cd CloudComputingTrabalho03
```

---

### 2. Construir o Container

```bash
docker compose up -d --build
```

---

### 3. Acessar o Container

```bash
docker exec -it trabalho03-linux bash
```

---

### 4. Acessar a Pasta dos Scripts

```bash
cd /app/scripts
```

---

### 5. Atualizar o Sistema

```bash
./01_update.sh
```

---

### 6. Instalar o Node.js

```bash
./02_node.sh
```

---

### 7. Criar Estrutura do Projeto

```bash
./03_estrutura.sh
```

---

### 8. Instalar e Configurar PostgreSQL

```bash
./10_banco.sh
```

---

### 9. Executar o Deploy da Aplicação

```bash
./05_deploy.sh
```

---

## Executando pelo Menu

Também é possível executar todas as funcionalidades através do menu principal:

```bash
./menu.sh
```

---

## Acessando a Aplicação

Após o deploy, a aplicação estará disponível em:

```text
http://localhost:3000
```

Caso esteja utilizando uma máquina virtual, utilize o IP da VM:

```text
http://IP_DA_VM:3000
```

---

## Banco de Dados

Banco:

```text
ingressos
```

Usuário:

```text
admin
```

Senha:

```text
admin
```

Porta:

```text
5432
```

---

## Objetivos do Trabalho

* Aplicar conceitos de Cloud Computing.
* Utilizar containers Linux para provisionamento de ambientes.
* Automatizar tarefas administrativas utilizando Shell Script.
* Implantar uma aplicação Node.js.
* Integrar a aplicação com PostgreSQL.
* Demonstrar práticas básicas de DevOps e automação de infraestrutura.

---

## Autor

Carlos Eduardo Nogueira de Oliveira

Trabalho desenvolvido para a disciplina de Cloud Computing.
