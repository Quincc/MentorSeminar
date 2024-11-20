#!/bin/bash

# 1. Чтение данных из файла input.txt
echo "Содержимое файла input.txt:"
if [ -f input.txt ]; then
    cat input.txt
else
    echo "Файл input.txt не найден."
    exit 1
fi

# 2. Перенаправление вывода команды wc -l в файл output.txt
wc -l < input.txt > output.txt
echo "Количество строк в input.txt записано в файл output.txt."

# 3. Перенаправление ошибок команды ls в файл error.log
ls nonexistent_file 2> error.log
echo "Ошибки команды ls для несуществующего файла записаны в error.log."
