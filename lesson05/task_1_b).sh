#!/bin/bash

# Задание 2.

# b) Изменить скрипт мониторинга лога, чтобы он выводил сообщения 
# при попытке неудачной аутентификации пользователя /var/log/auth.log, 
# отслеживая сообщения примерно такого вида:
# May 16 19:45:52 vlamp login[102782]: FAILED LOGIN (1) on '/dev/tty3' FOR 'user', Authentication failure
# Проверить скрипт, выполнив ошибочную регистрацию с виртуального терминала.

# Проверить скрипт, выполнив ошибочную регистрацию с виртуального терминала.
# LOG_FILE='/var/log/auth.log'
# tail -0f $LOG_FILE | while read i
# do
# 	grep FAILED | echo "Ошибка аутентификации"
# done

# Альтернативное решение:
LOG=/var/log/auth.log

if [ -e $LOG ]
then
        tail -f "${LOG}" | while read i
        do
                if [[ $i =~ "FAILED LOGIN" ]]
                then
                        echo Ошибка аутентификации
                        continue
                fi
        done
else
        echo File not found
        exit 1
fi
