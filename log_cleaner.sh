#!/bin/bash
# Limpa logs antigos mantendo últimos N dias
DIR=${1:-/var/log}
DAYS=${2:-7}
find $DIR -type f -mtime +$DAYS -exec rm -f {} \;
