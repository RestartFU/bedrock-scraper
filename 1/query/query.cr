require "socket"
require "./result"

MSG = Base64.decode "AQAAAABkAk6fAP//AP7+/v79/f39EjRWeAAAAAAAAAAA"

module Query
  extend self
  def query(addr : String, port : Int64) : Result | Nil
    client = UDPSocket.new
    client.connect addr, port

    client.send MSG
    client.read_timeout = 5
    
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
    rescue
      return nil
    end
  end
end

