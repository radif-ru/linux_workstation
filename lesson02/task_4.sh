# Задание 4.

#  В ОС Linux скрытыми файлами считаются те, имена которых начинаются с символа “.”. 
# Сколько скрытых файлов в вашем домашнем каталоге? (Использовать конвейер. 
# Подсказка: для подсчета количества строк можно использовать wc). 

ls -ad .* | wc -l # ответ - 20 из 30 файлов скрыты
