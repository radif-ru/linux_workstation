# Задание 1.

# Настроить nginx с php-fpm.

sudo apt install php-fpm
sudo systemctl status php7.2-fpm
sudo nano /etc/nginx/sites-available/default 

# Здесь:
index index.html index.htm index.nginx-debian.html;

server_name _;

# Добавляем:
index index.php index.html index.htm index.nginx-debian.html;
        
server_name 192.168.42.201;


# Раскомментируем код, версию php устанавливаем 7.2, в fastcgi_pass unix: убираем /var
#location ~ \.php$ {
#       include snippets/fastcgi-php.conf;
#
#       # With php-fpm (or other unix sockets):
#       fastcgi_pass unix:/var/run/php/php7.0-fpm.sock;
#       # With php-cgi (or other tcp sockets):
#       fastcgi_pass 127.0.0.1:9000;
#}

# Получается:
location ~ \.php$ {
        include snippets/fastcgi-php.conf;
#
#       # With php-fpm (or other unix sockets):
        fastcgi_pass unix:/run/php/php7.2-fpm.sock;
#       # With php-cgi (or other tcp sockets):
#       fastcgi_pass 127.0.0.1:9000;
}

sudo nginx -t
sudo systemctl restart nginx
