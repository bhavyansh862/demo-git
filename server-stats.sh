#!/bin/bash

#cpu usage

echo "========================"
echo "      CPU USAGE"
echo "========================"
echo
CPU=$(top -bn1 | grep "Cpu(s)")
echo "$CPU"
echo
echo "========================"
echo "     MEMORY USAGE"
echo "========================"
free -h | awk '/Mem:/ {
total=$2
used=$3
avai=$3

printf "Used: %.2f%%\n", (avai/total)*100
printf "Free: %.2f%%\n", ((total-avai)/total)*100

}'

echo 
echo "========================"
echo "       disk usage"
echo "========================"
df -h / | awk 'NR==2 {
used=$3
avai=$4
percent=$5
gsub("%", "", percent)

printf "used: %s (%s%%)\n", used, percent
printf "free: %s (%d%%)\n", avai, 100-percent


}'

echo
echo "========================"
echo "     MEMORY USAGE top 5"
echo "========================"
ps aux --sort=-%mem | head -6

echo
echo "========================"
echo "    CPU USAGE top 5"
echo "========================"
ps aux --sort=-%cpu | head -6


echo
echo "========================"
echo "    uptime"
echo "========================"
uptime -p

echo
echo "========================"
echo "   Load average"
echo "========================"
uptime 

echo
echo "========================"
echo "   OS versione"
echo "========================"
cat /etc/os-release | grep PRETTY_NAME


