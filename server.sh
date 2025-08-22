#!/bin/bash

RED="\e[1;31m"
GREEN="\e[1;32m"
EXIT="\e[0m"
divider(){
	echo -e "${RED}==============================${EXIT}"
}
clear
echo -e "	${GREEN}*************************************${EXIT}"
echo -e "	${GREEN}*****SERVER UTILIZATION *************${EXIT}"
echo -e "	${GREEN}*************************************${EXIT}"
divider
echo
echo -e  "today date is :$(date)"
echo
divider
echo
echo "currently logged-on users:"
w
echo
divider
echo "uptime:$(uptime)"
echo
divider
echo
echo "last logins:"
last -a | head -n 3
echo
divider
echo
echo "Disk and memory usage"
echo
df -h | awk 'NR>1{printf "Disk: %-20s Size: %-6s Used: %-6s Avail: %-6s Use%%: %-4s\n",$1,$2,$3,$4,$5}'
echo
free -m | awk 'NR==2{printf "memory usage: %sMB  / %sMB\n ", $3 ,$2 }'
echo
divider
echo
echo "utilization and must expernsive processes"
echo
top -b | head -n 3
echo
top -b | head -n 10 | tail -n 4
echo 
divider

