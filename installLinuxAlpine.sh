#!/bin/sh

# Actualizar repositorios e instalar actualizaciones
echo "http://dl-cdn.alpinelinux.org/alpine/latest-stable/main" >> /etc/apk/repositories
echo "http://dl-cdn.alpinelinux.org/alpine/latest-stable/community" >> /etc/apk/repositories

apk update
apk upgrade

# Instalar Docker y herramientas adicionales
apk add sudo
apk add docker
apk add nano
apk add bash
apk add wget curl
apk add tar
apk add coreutils
apk add openssh
apk add grep
apk add git
apk add procps-ng
apk add docker-cli-compose
apk add fish

# Iniciar y habilitar Docker en el arranque
service docker start
rc-update add docker boot

# Añadir usuario actual al grupo docker
addgroup andres docker

apk add sudo
addgroup -S wheel
adduser andres -G wheel -D
echo "andres ALL=(ALL) ALL" >> /etc/sudoers
visudo
