require "rest-client"
require "json"
require "pry"



class Get
  def self.get_game(id = 1)
    game_hash = {}
    game = RestClient.get("https://api.mobygames.com/v1/games?==&id=#{id}")
    game_data = JSON.parse(game)
    if game_data["games"] != []
    game_hash[:moby_id] = game_data["games"][0]["game_id"]
    game_hash[:title] = game_data["games"][0]["title"]
    game_data["games"][0]["sample_cover"] ? game_hash[:image] = game_data["games"][0]["sample_cover"]["image"] : game_hash[:image] = "/Users/mani/Development/code/Bootcamp/Final Project/game-drive/storage/No Cover art.png"
    end 

    game_hash
  end
end
