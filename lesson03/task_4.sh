# Задание 4. 

# Создать пользователя, обладающего возможностью выполнять действия от имени суперпользователя.

sudo useradd -m -G sudo -s /bin/bash sudo_user;
sudo passwd sudo_user;
