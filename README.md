A simple library wich can be used to send some monitoring data from ruby scripts to Zabbix via zabbix trapper item.

[Read this for details about Zabbix configuration.](https://www.zabbix.com/documentation/4.0/manual/config/items/itemtypes/trapper)

There are two methods:

"generate_message" method, wich generate string to be sended in Zabbix, from array of one or more hashes in following format:
```ruby
[{'host' => 'you_host', 'key' => 'you_key', 'value' => 'some_value'}]
```

"send_message" method, wich accepts server as a string, port as integer, and string from "generate_message" method.

"send_message" return hash, if we have Zabbix server on other side, or false, if not.

---

Простенькая библиотека для отправки данных из скриптов ruby в Zabbix через zabbix trapper.

[Тут можно прочитать как настроить траппер на стороне заббикса.](https://www.zabbix.com/documentation/4.0/manual/config/items/itemtypes/trapper)

Всего пара методов:

"generate_message", который генерирует строку в понятном заббиксу формате из массива содержащего один или более хешей следующего формата:
```ruby
[{'host' => 'you_host', 'key' => 'you_key', 'value' => 'some_value'}]
```

И "send_message", который принимает три параметра: сервер, в виде строки, порт в виде числа и строку для отправки сгенерированную методом "generate_message".

"send_message" вернет хеш с ответом заббикса, либо false, если по указанному адресу живет не заббикс. Или упадет, если там вообще нет никого :о)
