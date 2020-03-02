# Доп задание 5. 

# * Настроить доступ по ssh только из указанной сети.

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

# Работаем по SSH только с одной сетью
iptables -A INPUT -s 192.168.1.0/24 -p tcp -m tcp --dport 22 -j ACCEPT 
iptables -A OUTPUT -d 192.168.1.0/24 -p tcp -m tcp --sport 22 -j ACCEPT
