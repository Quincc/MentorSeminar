#!/bin/bash

# Путь к исходной директории для резервного копирования
SOURCE_DIR=$1

# Путь к директории для хранения резервных копий
BACKUP_DIR=$2

# Лог-файл
LOG_FILE="backup.log"

# Проверка, указаны ли исходная и целевая директории
if [ -z "$SOURCE_DIR" ] || [ -z "$BACKUP_DIR" ]; then
    echo "Использование: $0 <директория_источник> <директория_резервного_копирования>"
    exit 1
fi

# Проверка существования директории для резервного копирования
if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -p "$BACKUP_DIR"
    echo "Директория $BACKUP_DIR создана." >> "$LOG_FILE"
fi

# Получение текущей даты
CURRENT_DATE=$(date +"%Y-%m-%d")

# Счётчик файлов
file_count=0

# Создание резервной копии файлов
for file in "$SOURCE_DIR"/*; do
    if [ -f "$file" ]; then
        base_name=$(basename "$file")
        backup_name="${base_name}_${CURRENT_DATE}"
        cp "$file" "$BACKUP_DIR/$backup_name"
        echo "Резервная копия создана: $backup_name" >> "$LOG_FILE"
        ((file_count++))
    fi
done

# Итоговое сообщение
if (( file_count > 0 )); then
    echo "Резервное копирование завершено. Всего файлов: $file_count."
    echo "Логи операций сохранены в $LOG_FILE."
else
    echo "В исходной директории нет файлов для резервного копирования."
fi
