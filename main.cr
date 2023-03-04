require "./query"
require "./logger"

running = 0

success = 0
tot = 0

256.times do |x|
  256.times do |y|
    256.times do |z|
      256.times do |w|
        running += 1
        tot += 1

        if running >= 20000
            sleep 10.milliseconds
        end
        
        spawn do
            addr = "#{w.to_s}.#{z.to_s}.#{y.to_s}.#{x.to_s}"
            r = Query.query addr, 19132
            if r != nil
                File.open("./server_list.txt", "a") do |file|
                    file.puts addr + " = " + r.to_json
                end
                success += 1
                Logger.info "(#{success.to_s}/#{tot.to_s})"
            end
            running -= 1 

        end
      end
    end
  end
end