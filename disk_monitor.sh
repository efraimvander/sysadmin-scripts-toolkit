#!/bin/bash
# Verifica uso de disco e alerta se acima do limite
DIR=${1:-/}
LIMIT=${2:-80}
USAGE=$(df -h $DIR | awk 'NR==2 {print $5}' | sed 's/%//')
if [ $USAGE -ge $LIMIT ]; then
echo "ALERTA: Uso de disco em $DIR está em ${USAGE}%"
fi