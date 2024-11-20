#!/bin/bash

# Пороговое значение использования памяти (в процентах)
MEMORY_THRESHOLD=80

# Функция для сбора и отображения данных о ресурсах системы
function monitor_resources() {
    echo "====== Системный мониторинг ======"
    
    # Загрузка процессора
    echo "Загрузка процессора:"
    mpstat 1 1 | grep "all" | awk '{print "CPU Usage: " 100 - $12 "%"}'

    # Использование памяти
    echo "Использование памяти:"
    free -h | awk '/Mem:/ {print "Используется: " $3 " / Всего: " $2 " (" $3/$2*100 "%)"}'

    # Использование дискового пространства
    echo "Использование дискового пространства:"
    df -h --output=source,pcent | grep -E '/$'

    echo "=================================="
}

# Функция для проверки и уведомления о превышении порога памяти
function check_memory_usage() {
    # Получение процента использования памяти
    memory_usage=$(free | awk '/Mem:/ {printf "%.0f", $3/$2 * 100}')

    # Проверка, превышен ли порог
    if (( memory_usage > MEMORY_THRESHOLD )); then
        echo "ВНИМАНИЕ: Использование памяти превышает ${MEMORY_THRESHOLD}%!"
        echo "Текущие процессы с наибольшим использованием ресурсов памяти:"
        echo "PID    USER    %MEM    COMMAND"
        ps aux --sort=-%mem | head -n 10
    else
        echo "Использование памяти в норме (${memory_usage}%)."
    fi
}

# Основная программа
monitor_resources
check_memory_usage
