class Api::V1::UserGamesController < ApplicationController
  def index
    @user_games = UserGame.all
    render json: @user_games
  end

  def show
    @user_game = UserGame.find(params[:id])
    render json: @user_game
  end

  def create
    byebug
    # Find or create the game in the database
    game = Game.where(rawg_id: user_games_params[:rawg_id]).first_or_create {|game| 
      game.title = user_games_params[:title]
      game.description = user_games_params[:description]
      game.img_url = user_games_params[:img_url]
    }
    if game.genres == []
      game.assign_genres(user_games_params[:game_genres])
    end 
    
    # 

    # @user_game = UserGame.new(user_games_params)
    # if @user_game.save
    #   render json: @user_game, status: :created
    # else
    #   render json: @user_game.errors, status: :unprocessable_entity
    # end
  end

  def destroy
    @user_game = UserGame.find_by(user_id: user_games_params[:user_id], game_id: user_games_params[:game_id])
    @user_game.destroy
  end

  private

  def user_games_params
    params.permit(:user_id, :game_id, :played?, :title, :img_url, :rawg_id, :description, :game_genres => [])
  end
end
