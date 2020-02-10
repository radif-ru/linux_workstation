# Задание 1. 

# Написать регулярное выражение, которое проверяет валидный IP-адрес. 
# Например, 192.168.1.1 подойдет, а 256.300.1.1 — нет.

\b((([0-2][0-5]{2})|(1[0-9]{2})|([0-9]{2})|([0-9]))\.){3}(([0-2][0-5]{2})|(1[0-9]{2})|([0-9]{2})|([0-9]))\b

# Альтернативное решение (^ - начало, $ - конец строки):
^((25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9]?[0-9])\.){3}(25[0-5]|2[0-4][0-9]|1[0-9][0-9]|[1-9][0-9]?)$