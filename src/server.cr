require "socket"
require "./logger"
require "toml"

sock = TCPSocket.new
sock.bind "192.168.2.157", 8084
sock.listen

while true
    conn = sock.accept
    spawn do 
        while true
            res, raddr = conn.receive
            if res.size <= 0
                break
            end
            Logger.debugln "#{res}"
            File.open("server_list.txt", "a") do |file|
                file.puts res
            end
        end
    end
end
