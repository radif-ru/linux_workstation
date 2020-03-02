# Задание 3.

# 3. Настроить сетевой фильтр, чтобы был доступ только к сервисам http и ssh.

# Действия по умолчанию
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

# Разрешаем обмен по локальной петле
iptables -A INPUT -i lo -j ACCEPT ip a
iptables -A OUTPUT -o lo -j ACCEPT

# Разрешаем пакеты icmp (для обмена служебной информацией)
iptables -A INPUT -p icmp -j ACCEPT
iptables -A OUTPUT -p icmp -j ACCEPT

# Разрешаем локальные соединения с динамических портов
iptables -A OUTPUT -p TCP -m tcp --sport 32768:61000 -j ACCEPT
iptables -A OUTPUT -p UDP -m udp --sport 32768:61000 -j ACCEPT

# Разрешить только те пакеты, которые мы запросили
iptables -A INPUT -p TCP -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p UDP -m state --state ESTABLISHED,RELATED -j ACCEPT

# Но если работаем как сервер SSH, следует разрешить и нужные порты
iptables -A INPUT -i eth0 -p tcp -m tcp --dport 22 -j ACCEPT 
iptables -A OUTPUT -o eth0 -p tcp -m tcp --sport 22 -j ACCEPT

# Разрешаем порты для http
iptables -A INPUT -i eth0 -p tcp -m tcp --dport 80 -j ACCEPT 
iptables -A OUTPUT -o eth0 -p tcp -m tcp --sport 80 -j ACCEPT

# Смотрим какие порты доступны:
nmap 192.168.42.201
