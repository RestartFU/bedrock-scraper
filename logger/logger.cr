require "./color"

private SEP   = "#{Color::RESET}#{Color::CYAN} | #{Color::RESET}"
private INFO  = "#{Color::Background::YELLOW}#{Color::BLACK} INFO #{SEP}"
private DEBUG = "DEBG #{SEP}"
private ERROR = "ERRO #{SEP}"

module Logger 
    extend self
    def info(s)
        puts "#{Color::RESET}#{INFO}#{s}"
    end
    def print_info(s)
        print "\x1b[1A\x1b[2K\r#{Color::RESET}#{INFO}#{s}"
    end
    def error(s)
        puts "#{Color::RESET}#{ERROR}#{s}"
    end
end