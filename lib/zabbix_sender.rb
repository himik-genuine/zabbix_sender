require 'json'
require 'socket'

# A simple library wich can be used to send some monitoring data from ruby scripts to Zabbix via zabbix trapper item.
# https://www.zabbix.com/documentation/4.0/manual/config/items/itemtypes/trapper for details about Zabbix configuration.
#
# generate_message method expects that "data" is array of one or more hashes in following format:
#  [{'host' => 'you_host' 'key' => 'you_key' 'value' => 'some_value'}]
# 
# send_message expects "server" as a string, "port" as integer, and "message" from generate_message.
#
# Result can be hash, if we have Zabbix server on other side, or false, if somthing go wrong.

class ZabbixSender
  def generate_message(data)
    body = JSON.generate({ 'request' => 'sender data', 'data' => data })
    "ZBXD\1".encode('ascii') + [body.bytesize].pack('i') + "\x00\x00\x00\x00" + body
  end

  def send_message(server, port, message)
    s = TCPSocket.new(server, port)
    s.write(message)
    header = s.recv(5)
    raw = s.recv(s.recv(8)[0, 4].unpack1('i'))
    s.close
    header == "ZBXD\1" ? JSON.parse(raw) : false
  end
end
