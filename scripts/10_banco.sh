#!/bin/bash

echo "Instalando PostgreSQL..."

apt-get install -y postgresql postgresql-contrib

service postgresql start

sudo -u postgres psql <<EOF

CREATE USER admin
WITH PASSWORD 'admin';

CREATE DATABASE ingressos
OWNER admin;

GRANT ALL PRIVILEGES
ON DATABASE ingressos
TO admin;

EOF

echo "Banco configurado."