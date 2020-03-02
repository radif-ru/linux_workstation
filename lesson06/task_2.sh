# Задание 2.

# 2. Настроить nginx в качестве балансировщика. 
# Используя mod_upstream, раскидывать весь входящий трафик по трем Apache2-серверам, находящимся в локальной сети.

sudo nano /etc/nginx/sites-available/default 

upstream backend {
    server test.a:8080;
    server test.b:8080;
    server test.c:8080;
}

# Заменяем адрес в proxy_pass:
# Add index.php to the list if you are using PHP
index index.php index.html index.htm index.nginx-debian.html;

server_name 192.168.42.201;

location / {
        proxy_pass http://192.168.42.201:8080;
        proxy_set_header Host $host;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Real-IP $remote_addr;
        # First attempt to serve request as file, then
        # as directory, then fall back to displaying a 404.
        try_files $uri $uri/ =404;
}

# ...
# Add index.php to the list if you are using PHP
index index.php index.html index.htm index.nginx-debian.html;

server_name 192.168.42.201;

location / {
        proxy_pass http://backend;
        proxy_set_header Host $host;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Real-IP $remote_addr;
        # First attempt to serve request as file, then
        # as directory, then fall back to displaying a 404.
        try_files $uri $uri/ =404;
}

sudo nginx -t
sudo systemctl restart nginx
