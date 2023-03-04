require "./color"

private SEP   = "#{Color::RESET}#{Color::CYAN} | #{Color::RESET}"
private INFO  = "#{Color::Background::YELLOW}#{Color::BLACK} INFO #{SEP}"
private DEBUG = "DEBG #{SEP}"
private ERROR = "ERRO #{SEP}"

module Logger 
    extend self
    module Utils
        extend self
        def clear_line()
            print "\x1b[2K"
        end
        def cursor_up()
            print "\x1b[1A"
        end
        def cursor_beg()
            print "\r"
        end
    end

    def info(s)
        puts "#{Color::RESET}#{INFO}#{s}"
    end
    def print_info(s)
        print "#{Color::RESET}#{INFO}#{s}"
    end
    def error(s)
        puts "#{Color::RESET}#{ERROR}#{s}"
    end
end