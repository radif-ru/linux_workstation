# Задание 6.

# Запустить в одном терминале программу, в другом терминале посмотреть PID процесса 
# и остановить с помощью kill, посылая разные типы сигналов. Что происходит?

vi test_vi
ps ax | grep vi
kill -15 6696 # ничего не произошло
kill - 9 6696 # программа закрылась в терминале Ubuntu, команда подана с Putty на Windows
