# 🚀 WebFusion Digital - Despliegue Automatizado con Contenedores

Este repositorio contiene la Infraestructura como Código (IaC) diseñada para resolver los problemas de despliegue manual del equipo de WebFusion Digital S.L.

## 🎯 Objetivo del Proyecto
Desarrollar un entorno automatizado que permita desplegar y mantener actualizada la página principal de un sitio WordPress utilizando control de versiones, virtualización ligera y contenedores.

## 🛠️ Tecnologías Implementadas
* **Vagrant (Ubuntu 20.04):** Para el provisionamiento de la máquina virtual.
* **Docker & Docker Compose (v2.4):** Para la orquestación de servicios (WordPress y MySQL).
* **Git / GitHub:** Para el control de versiones y actualización automatizada del código.
* **Shell Scripting:** Para la instalación desatendida de dependencias (`provision.sh`).

## ⚙️ Instrucciones de Despliegue (Cómo levantar el entorno)
Cualquier desarrollador del equipo puede reproducir este entorno siguiendo estos pasos:

1. Clona este repositorio en tu máquina local:
   `git clone https://github.com/CristianAlexis-tech/webfusion-automatizado.git`
2. Entra en el directorio del proyecto.
3. Crea un archivo oculto llamado `.env` basándote en la documentación interna para cargar las contraseñas seguras de la base de datos.
4. Levanta la infraestructura ejecutando:
   `vagrant up`
5. Accede a tu navegador en la dirección: `http://localhost:8080`

## 🔄 Cómo actualizar el código web (Sincronización Automática)
Este entorno elimina la necesidad de mover archivos por FTP o SSH manualmente.
Para actualizar la web:
1. Modifica el archivo `src/index.php` y sube los cambios (Commit & Push) a este repositorio.
2. En la terminal de tu máquina Host (donde hiciste `vagrant up`), ejecuta el comando de actualización:
   `vagrant provision`
3. El contenedor dedicado de Git descargará los cambios y los inyectará en WordPress automáticamente. Recarga tu navegador en `http://localhost:8080/wp-content/themes/tema-webfusion/index.php` para ver los cambios.

---
*Proyecto desarrollado para el módulo de despliegue de aplicaciones.*