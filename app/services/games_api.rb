# frozen_string_literal: true

require 'rest-client'
require 'pry'
require 'byebug'
# frozen_string_literal: true

# Get game information from RawG API

class GamesApi
  def retrieve_games(url)
    response = RestClient.get(url, { "User-Agent": 'Game Drive' })
    games_data = JSON.parse(response)
    format_games_data(games_data)
  end

  def format_games_data(games_data)
    {
      games: games_data['results'].map do |game|
        {
          title: game['name'],
          image: game['background_image'],
          rawg_id: game['id']
        }
      end,
      next: games_data['next'],
      previous: games_data['previous']
    }
  end

  def retrieve_game(id)
    response = RestClient.get(ENV['RAWG_URL'] + "/#{id}", { "User-Agent": 'Game Drive' })
    game = JSON.parse(response) 
    format_game_data(game)
  end

  def format_game_data(game)
    {
      title: game['name'],
      description: game['description'],
      image: game['background_image']
    }
  end
end
