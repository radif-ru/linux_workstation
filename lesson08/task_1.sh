# Задание. 

# Установить в виртуальную машину или VDS Docker, сделать два контейнера, один для Nginx, второй для MySQL, настроить совместную работу. 
# Если вы изучаете программирование на PHP, Python или Java, используйте их в проектах для работы с БД. 
# Если вы изучаете системное администрирование, тестирование или информационную безопасность, воспользуйтесь PHP и несложной CMS, например, WordPress.

radif@radif-VirtualBox:~/lesson08/wordpress-compose$ docker-compose ps
            Name                          Command               State          Ports        
--------------------------------------------------------------------------------------------
wordpresscompose_db_1          docker-entrypoint.sh mysqld      Up      3306/tcp, 33060/tcp 
wordpresscompose_nginx_1       nginx -g daemon off;             Up      0.0.0.0:80->80/tcp  
wordpresscompose_wordpress_1   docker-entrypoint.sh apach ...   Up      0.0.0.0:8000->80/tcp
