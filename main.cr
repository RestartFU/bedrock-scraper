require "./query"
require "./logger"

running = 0
success = 0
total = 0

MAX_IPV4 = 4294967296

estimate_time_left = Time::Span.new

spawn do
    while true
        estimate_time_left = Time::Span.new(seconds: ((MAX_IPV4 - total) / running).to_i64)
        Logger.print_info "(#{success}/#{total}) #{((total * 100) / MAX_IPV4).round(2)}% done #{(estimate_time_left.total_hours - (estimate_time_left.minutes / 60)).to_i64}h#{estimate_time_left.minutes}m#{estimate_time_left.seconds}s left"
        sleep 1.seconds
    end
end

256.times do |x|
  256.times do |y|
    256.times do |z|
      256.times do |w|
        running += 1
        total += 1

        if running >= 20000
            sleep 10.milliseconds
        end
        
        spawn do
            addr = "#{w}.#{z}.#{y}.#{x}"
            r = Query.query addr, 19132
            if r != nil
                File.open("./server_list.txt", "a") do |file|
                    file.puts addr + " = " + r.to_json
                end
                success += 1
            end
            running -= 1 

        end
      end
    end
  end
end