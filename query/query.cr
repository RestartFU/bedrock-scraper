require "socket"
require "./result"

MSG = Base64.decode "AQAAAABkAk6fAP//AP7+/v79/f39EjRWeAAAAAAAAAAA"

module Query
  extend self
  def query(addr : String, port : Int64) : Result | Nil
    begin
      client = UDPSocket.new
      client.close_on_exec = true
    rescue ex
      p ex.message
      return nil
    end

    begin
      client.connect addr, port
    rescue ex
      return nil
    end

    client.send MSG
    client.read_timeout = 2
    
    begin
      res, _ = client.receive
      arr = res.split ";"

    if arr[0].ends_with? "MCPE"
      Result.new(
        arr[1],
        arr[2].to_i64,
        arr[3],
        arr[4].to_i64,
        arr[5].to_i64,
        arr[7],
        arr[8]
      )
    end
    rescue ex
      return nil
    end
  end
end

