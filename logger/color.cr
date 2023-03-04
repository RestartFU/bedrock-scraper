module Color
    extend self
    BLACK   = "\033[30m"
    RED     = "\033[31m"
    GREEN   = "\033[32m"
    ORANGE  = "\033[33m"
    BLUE    = "\033[34m"
    MAGENTA = "\033[35m"
    CYAN    = "\033[36m"
    class Background
        BLACK   = "\033[40m"
        RED     = "\033[41m"
        GREEN   = "\033[42m"
        ORANGE  = "\033[43m"
        BLUE    = "\033[44m"
        MAGENTA = "\033[45m"
        CYAN    = "\033[46m"
        YELLOW  = "\033[103m"
        WHITE   = "\033[107m"
    end
    RESET = "\033[0m"
end