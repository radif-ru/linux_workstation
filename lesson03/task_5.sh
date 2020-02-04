# Доп. задание 5. 

# * Создать группу developer, несколько пользователей, входящих в эту группу. 
# Создать директорию для совместной работы. 
# Сделать так, чтобы созданные одними пользователями файлы 
# могли изменять другие пользователи этой группы.

sudo groupadd developer;
grep developer /etc/group; # проверяем группу
sudo useradd -m -G developer -s /bin/bash user1;
sudo passwd user1;
sudo useradd -m -G developer -s /bin/bash user2;
sudo passwd user2;
sudo useradd -m -G developer -s /bin/bash user3;
sudo passwd user3;
grep developer /etc/group; # проверяем группу, видим там user1, user2, user3, GID 1001
mkdir developer;
chgrp developer ./developer # изменил группу для папки developer с radif на developer
sudo chmod g+s developer/ # теперь созданные файлы попадают в группу developer
