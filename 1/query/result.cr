struct Result
    getter motd : String
    getter protocol_version : Int64
    getter version : String
    getter player_count : Int64
    getter max_player_count : Int64
    getter software : String
    getter gamemode : String

    def initialize(@motd, @protocol_version, @version, @player_count, @max_player_count, @software, @gamemode); end
end