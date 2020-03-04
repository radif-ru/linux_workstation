# Доп задание 4.

# * Настроить правила iptables, чтобы из внешней сети можно было обратиться только к портам 80 и 443. 
# Запросы, идущие на порт 8080, перенаправлять на порт 80.

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
iptables -A OUTPUT -p tcp -m tcp --sport 32768:61000 -j ACCEPT
iptables -A OUTPUT -p udp -m udp --sport 32768:61000 -j ACCEPT

# Разрешить только те пакеты, которые мы запросили
iptables -A INPUT -p tcp -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p udp -m state --state ESTABLISHED,RELATED -j ACCEPT

# Разрешаем порты для http
iptables -A INPUT -i eth0 -p tcp -m tcp --dport 80 -j ACCEPT 
iptables -A OUTPUT -o eth0 -p tcp -m tcp --sport 80 -j ACCEPT

# Разрешаем порты для https
iptables -A INPUT -i eth0 -p tcp -m tcp --dport 443 -j ACCEPT 
iptables -A OUTPUT -o eth0 -p tcp -m tcp --sport 443 -j ACCEPT

# Перенаправляем порты
iptables -A PREROUTING -p tcp -m tcp --dport 8080 -j REDIRECT --to-ports 80
