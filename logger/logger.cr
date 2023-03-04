require "./color"

private SEP   = "#{Color::RESET}#{Color::CYAN} | #{Color::RESET}"
private INFO  = "#{Color::Background::YELLOW}#{Color::BLACK} INFO #{SEP}"
private DEBUG = "DEBG #{SEP}"
private ERROR = "ERRO #{SEP}"

module Logger 
    extend self
    def info(s : String)
        puts "#{Color::RESET}#{INFO}#{s}"
    end
    def error(s : String)
        puts "#{Color::RESET}#{ERROR}#{s}"
    end
end