#!/bin/bash
echo "=== Iniciando Aprovisionamiento de WebFusion ==="

# 1. Instalación automatizada de Docker y Docker Compose
if ! command -v docker &> /dev/null; then
    echo "Instalando Docker y herramientas necesarias..."
    apt-get update
    apt-get install -y docker.io docker-compose git
    usermod -aG docker vagrant
else
    echo "Docker ya está instalado."
fi

# 2. Despliegue de servicios (Levantar BD y WordPress)
echo "Levantando el entorno con Docker Compose..."
cd /vagrant
docker-compose up -d db wordpress

# 3. Ejecutar el contenedor Git para actualizar el código
# El flag --force-recreate obliga al contenedor a ejecutarse de nuevo,
# descargando los últimos cambios de Git y moviendo el PHP, cumpliendo 
# el requisito de actualización automática al ejecutar 'vagrant provision'.
echo "Ejecutando contenedor Git para sincronizar código..."
docker-compose up --force-recreate git-updater

echo "=== Aprovisionamiento Completado ==="
