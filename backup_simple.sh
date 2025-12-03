#!/bin/bash
# Backup simples de directório
SRC=$1
DEST=$2
mkdir -p $DEST
tar -czf $DEST/backup_$(basename $SRC)_$(date +%F).tar.gz $SRC
