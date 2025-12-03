#!/bin/bash
# Testa ping em hosts fornecidos
for host in "$@"; do
ping -c 2 $host > /dev/null 2>&1
if [ $? -eq 0 ]; then
echo "$host está online"
else
echo "$host está offline"
fi
done
