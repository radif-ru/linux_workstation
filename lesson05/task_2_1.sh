#!/bin/bash

# Задание 2.1

# 2.Более сложные задания на скрипты (и cron):
# Создать файл crontab, который ежедневно регистрирует занятое каждым пользователем дисковое
# пространство в его домашней директории.
   
# пробуем выяснить список пользователей
for user in `cat /etc/passwd | grep ':/home/' | sed 's/\:.*//'`
do
        if [ -d /home/$user ]
        then
                echo `du -sh /home/$user`
        fi
done

# Далее добавляю в крон написанный скрипт:
crontab -e

0 10 * * * /home/mvgrachev/tasks5/user_disk_usage.sh > /home/mvgrachev/tasks5/log_disk_usage.log
