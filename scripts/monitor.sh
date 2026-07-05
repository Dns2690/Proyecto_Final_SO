#!/bin/bash

LOG="/home/linux/monitoreo/monitor.log"
mkdir -p /home/linux/monitoreo

CPU_LIMIT=80
RAM_LIMIT=80
DISK_LIMIT=90

CPU_USE=$(top -bn1 | grep "Cpu(s)" | awk '{print 100 - $8}' | cut -d. -f1)
RAM_USE=$(free | awk '/Mem/{printf "%d", $3/$2 * 100}')
DISK_USE=$(df / | awk 'NR==2{print $5}' | tr -d '%')

FECHA=$(date '+%Y-%m-%d %H:%M:%S')

if [ "$CPU_USE" -gt "$CPU_LIMIT" ]; then
  PROC=$(ps -eo pid,comm,%cpu --sort=-%cpu | awk 'NR==2')
  echo "[$FECHA]
ALERTA: CPU excedido
Uso actual: ${CPU_USE}%
Proceso: $(echo $PROC | awk '{print $2}')
PID: $(echo $PROC | awk '{print $1}')" >> "$LOG"
fi

if [ "$RAM_USE" -gt "$RAM_LIMIT" ]; then
  PROC=$(ps -eo pid,comm,%mem --sort=-%mem | awk 'NR==2')
  echo "[$FECHA]
ALERTA: RAM excedida
Uso actual: ${RAM_USE}%
Proceso: $(echo $PROC | awk '{print $2}')
PID: $(echo $PROC | awk '{print $1}')" >> "$LOG"
fi

if [ "$DISK_USE" -gt "$DISK_LIMIT" ]; then
  echo "[$FECHA]
ALERTA: Disco excedido
Uso actual: ${DISK_USE}%" >> "$LOG"
fi
