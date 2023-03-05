require "json"

struct Result
    include JSON::Serializable
    
    @[JSON::Field(key: "motd")]
    getter motd : String
    @[JSON::Field(key: "protocol_version")]
    getter protocol_version : Int64
    @[JSON::Field(key: "version")]
    getter version : String
    @[JSON::Field(key: "player_count")]
    getter player_count : Int64
    @[JSON::Field(key: "max_player_count")]
    getter max_player_count : Int64
    @[JSON::Field(key: "software")]
    getter software : String
    @[JSON::Field(key: "gamemode")]
    getter gamemode : String

    def initialize(@motd, @protocol_version, @version, @player_count, @max_player_count, @software, @gamemode); end
end