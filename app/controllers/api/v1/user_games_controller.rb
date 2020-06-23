# frozen_string_literal: true

module API
  module V1
    class UserGamesController < ApplicationController
      def index
        @user_games = UserGame.all
        render json: @user_games
      end

      def show
        @user_game = UserGame.find(params[:id])
        render json: @user_game
      end

      def create
        # Find or create the game in the database
        game = Game.where(rawg_id: user_games_params[:rawg_id]).first_or_create do |game|
          game.title = user_games_params[:title]
          game.description = user_games_params[:description]
          game.img_url = user_games_params[:img_url]
        end
        #  Assign genres if a new game
        game.assign_genres(user_games_params[:game_genres]) if game.genres == []
        #  Create the user-game relationship
        @user_game = UserGame.new(game_id: game.id, user_id: user_games_params[:user_id])
        if @user_game.save
          render json: @user_game, status: :created
        else
          render json: @user_game.errors, status: :unprocessable_entity
        end
      end

      def incollection
        user = User.find(user_games_params[:user_id])

        game = Game.find_by(rawg_id: user_games_params[:rawg_id])

        if user.games.include?(game)
          render json: true
        else
          render json: false
        end
      end

      def destroy
        @user_game = UserGame.find_by(user_id: user_games_params[:user_id], game_id: user_games_params[:game_id])
        @user_game.destroy
      end

      def remove
        user = User.find(user_games_params[:user_id])
        game = Game.find_by(rawg_id: user_games_params[:rawg_id])
        user_game = UserGame.where(user_id: user.id, game_id: game.id)[0]
        user_game.destroy
      end

      private

      def user_games_params
        params.permit(:user_id, :game_id, :played?, :title, :img_url, :rawg_id, :description, game_genres: [])
      end
    end
  end
end
