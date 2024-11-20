#!/bin/bash

# Функция для вывода строки с префиксом "Hello, "
function greet() {
    local name=$1
    echo "Hello, $name"
}

# Функция для вычисления суммы двух чисел
function sum() {
    local num1=$1
    local num2=$2
    echo $((num1 + num2))
}

# Вызов функции greet
echo "Введите имя:"
read name
greet "$name"

# Вызов функции sum
echo "Введите первое число:"
read number1
echo "Введите второе число:"
read number2
result=$(sum "$number1" "$number2")
echo "Сумма чисел $number1 и $number2 равна $result"
