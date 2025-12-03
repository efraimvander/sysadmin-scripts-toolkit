#!/bin/bash
# Mata processos que consomem CPU acima do limite
LIMIT=${1:-50}
ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | awk -v limit=$LIMIT '$4>limit {print $1}' | xargs -r kill -9
