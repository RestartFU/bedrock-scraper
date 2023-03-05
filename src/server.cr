require "./logger"
require "./env"
require "socket"

sock = TCPSocket.new
sock.bind(ADDR, PORT)
sock.listen()

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
