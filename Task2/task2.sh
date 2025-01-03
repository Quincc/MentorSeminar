#!/bin/bash

# Вывод текущего значения PATH
echo "Текущее значение PATH:"
echo "$PATH"

# Проверка, был ли передан аргумент
if [ -z "$1" ]; then
    echo "Ошибка: необходимо указать директорию в качестве аргумента."
    exit 1
fi

# Добавление новой директории в PATH
new_dir="$1"
export PATH="$PATH:$new_dir"

# Вывод обновлённого значения PATH
echo "Обновлённое значение PATH:"
echo "$PATH"