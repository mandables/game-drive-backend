require "rest-client"
require "json"

Url = "https://api.mobygames.com/v1/games?api_key=WrxFqDxH6RG0Adl/Ltrw1g==&id="

class Get
  def self.get_game(id = 1)
    game_hash = {}
    game = RestClient.get("https://api.mobygames.com/v1/games?api_key=WrxFqDxH6RG0Adl/Ltrw1g==&id=#{id}")
    game_data = JSON.parse(game)
    game_hash[:moby_id] = game_data["gem_id"]
    game_hash[:title] = game_data["title"]
    game_hash[:image] = game_data["same_cover"]["image"]
    game_hash
  end
end
