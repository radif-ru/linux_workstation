# Задание 5.

# Попробовать вывести с помощью cat все файлы в директории /etc. 
# Направить ошибки в отдельный файл в вашей домашней директории. 
# Сколько файлов, которые не удалось посмотреть, оказалось в списке?

cat * /etc 2> test/warnings.log
wc -l test/warnings.log # ответ 11 файлов не удалось посмотреть
