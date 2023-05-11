#!/bin/bash

#actualización de repositorios y paquetes
sudo yum update -y

#instalacion de Docker
sudo yum install -y docker
sudo docker info

#instalacion Git
sudo yum install git -y

#Confirmar version de Git
git --version

#levantamiento contenedores petplate
sudo docker pull postgres
sudo docker pull mongo
sudo docker pull brayanesq/pet-plate-frontend:v1.5 #hacer pull al contenedor propio#
sudo docker pull brayanesq/pet-plate-frontend:v1.5
sudo docker pull brayanesq/pet-plate-backend2:v1.1
sudo docker pull brayanesq/pet-plate-chatbot:v1.3

#Despues de crear y configurar el docker-compose, instalar las dependencias del mismo

sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/loca>
sudo chmod +x /usr/local/bin/docker-compose
sudo docker-compose --version

#Inicializar el docker compose
sudo docker-compose up -d
