#!/bin/bash

echo "Instalando Node.js..."

curl -fsSL https://deb.nodesource.com/setup_20.x | bash -

apt-get install -y nodejs

echo "Node instalado:"
node -v

echo "NPM instalado:"
npm -v