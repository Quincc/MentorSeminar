#!/bin/bash

# 1. Создание списка всех файлов в текущей директории с указанием их типа
echo "Список файлов в текущей директории:"
for item in *; do
    if [ -d "$item" ]; then
        echo "$item - каталог"
    elif [ -f "$item" ]; then
        echo "$item - файл"
    else
        echo "$item - другой тип"
    fi
done

echo ""

# 2. Проверка наличия определённого файла, переданного как аргумент
if [ -z "$1" ]; then
    echo "Ошибка: вы не указали имя файла для проверки."
else
    if [ -e "$1" ]; then
        echo "Файл '$1' существует."
    else
        echo "Файл '$1' не существует."
    fi
fi

echo ""

# 3. Вывод информации о каждом файле: имя и права доступа
echo "Информация о файлах:"
for item in *; do
    permissions=$(ls -ld "$item" | awk '{print $1}')
    echo "$item - права доступа: $permissions"
done
