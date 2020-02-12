#!/bin/bash

# Задание 1.

# a) Написать скрипт, который удаляет из текстового файла пустые строки и 
# заменяет маленькие символы на большие (воспользуйтесь tr или sed).
# old_path_text='/home/radif/lesson05/task_1.txt'
# new_path_text='/home/radif/lesson05/task_1_new.txt'
# sed '/^$/d' $old_path_text | tr [a-zа-я] [A-ZА-Я] > $new_path_text

# Альтернативное решение:
if [ $# != 1 ]
then
	echo Должен быть один параметр
 	echo Формат использования
 	echo $0 file
 	exit 1
 fi
  
 file=$1
 if [ -e $file ]
 then
 	cat $file | sed '/^[[:space:]]*$/d' | tr -s "[:lower:]" "[:upper:]" > tempfile
 	mv tempfile $file
 else
 	echo Файл $file не найден
 	exit 1
 fi
