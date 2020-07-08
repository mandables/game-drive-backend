# frozen_string_literal: true

module Api
  module V1
    class ApiConnectorController < ApplicationController
      def fetch_games
        games = GamesApi.new.retrieve_games(ENV["RAWG_URL"])
        render json: games
      end

      def fetch_game
        game = GamesApi.new.retrieve_game(params["id"])
        render json: game
      end 

      def search 
        games = GamesApi.new.retrieve_games("#{ENV['RAWG_URL']}?search=#{params['searchTerm']}")
        render json: games
      end
    end
  end
end
