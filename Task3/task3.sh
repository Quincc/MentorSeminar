#!/bin/bash

# Запрос ввода числа у пользователя
read -p "Введите число: " number

# Проверка числа с использованием if
if (( number > 0 )); then
    echo "Число положительное."
elif (( number < 0 )); then
    echo "Число отрицательное."
else
    echo "Число равно нулю."
fi

# Если число положительное, выполняем подсчёт от 1 до введённого числа
if (( number > 0 )); then
    echo "Подсчёт от 1 до $number:"
    counter=1
    while (( counter <= number )); do
        echo "$counter"
        ((counter++))
    done
fi