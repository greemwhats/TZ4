



Тестовое задание
Развернуть
2 контейнера через docker-compose.



Первый
должен быль доступен снаружи на порту
8888 установлен nginx, который перенаправляет
все запросы на второй контейнер по
внутренней сети docker логи необходимо
писать в файловую систему хоста.

Второй
недоступен снаружи, принимает соединения
только из внутренней сети на 80 порту
весит веб-страничка index.php, которая
выводит phpinfo(); нужно, чтобы в index.php перед
вызовом функции phpinfo(); выводился IP, с
которого пришел запрос Написать скрипт
на bash, который при запуске будет парсить
лог nginx из первого контейнера и сохранять
в файл только уникальные ip адреса с
которых заходили на страничкуКод скрипта
и docker-compose разместить в публичном доступе
github.


###############################################

Выполнено.


