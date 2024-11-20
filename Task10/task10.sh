#!/bin/bash

# Исходная директория
SOURCE_DIR=$1

# Директории для сортировки
IMAGES_DIR="$SOURCE_DIR/Images"
DOCUMENTS_DIR="$SOURCE_DIR/Documents"

# Лог-файл
LOG_FILE="$SOURCE_DIR/sorting.log"

# Проверка существования директории
if [ -z "$SOURCE_DIR" ]; then
    echo "Использование: $0 <директория_источник>"
    exit 1
fi

# Создание папок для сортировки
mkdir -p "$IMAGES_DIR" "$DOCUMENTS_DIR"

# Функция для перемещения файлов
move_files() {
    local pattern=$1
    local target_dir=$2
    local file_count=0

    for file in "$SOURCE_DIR"/*$pattern; do
        if [ -f "$file" ]; then
            mv "$file" "$target_dir"
            echo "$(date +"%Y-%m-%d %H:%M:%S") Перемещён файл: $(basename "$file") -> $target_dir" >> "$LOG_FILE"
            ((file_count++))
        fi
    done

    echo "$(date +"%Y-%m-%d %H:%M:%S") Перемещено файлов: $file_count в $target_dir" >> "$LOG_FILE"
}

# Сортировка файлов
move_files ".jpg" "$IMAGES_DIR"
move_files ".png" "$IMAGES_DIR"
move_files ".gif" "$IMAGES_DIR"

move_files ".txt" "$DOCUMENTS_DIR"
move_files ".pdf" "$DOCUMENTS_DIR"
move_files ".docx" "$DOCUMENTS_DIR"

# Итоговое сообщение
echo "Сортировка файлов завершена. Подробности в $LOG_FILE."