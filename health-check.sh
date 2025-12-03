
#!/bin/bash
# linux-health-check-lite
# Simple & fast health check for Linux systems

GREEN="\e[32m"; YELLOW="\e[33m"; RED="\e[31m"; NC="\e[0m"

echo -e "${GREEN}=== Linux Health Check Lite ===${NC}"

# 1. Uptime
echo -e "\n${YELLOW}[1] Uptime:${NC}"
uptime -p

# 2. CPU Load
echo -e "\n${YELLOW}[2] CPU Load:${NC}"
uptime | awk -F'load average:' '{ print $2 }'

# 3. Memory Usage
echo -e "\n${YELLOW}[3] Memory Usage:${NC}"
free -h

# 4. Disk Usage
echo -e "\n${YELLOW}[4] Disk Usage:${NC}"
df -h --total | grep -E "Filesystem|total"

# 5. Top 5 processes by CPU
echo -e "\n${YELLOW}[5] Top 5 CPU Processes:${NC}"
ps -eo pid,ppid,cmd,%cpu --sort=-%cpu | head -n 6

# 6. Top 5 processes by Memory
echo -e "\n${YELLOW}[6] Top 5 Memory Processes:${NC}"
ps -eo pid,ppid,cmd,%mem --sort=-%mem | head -n 6

# 7. Systemd failed services
echo -e "\n${YELLOW}[7] Failed systemd services:${NC}"
systemctl --failed || echo "No failed services."

# 8. Network interfaces
echo -e "\n${YELLOW}[8] Network Interfaces:${NC}"
ip -br a

echo -e "\n${GREEN}=== Health Check Complete ===${NC}"
