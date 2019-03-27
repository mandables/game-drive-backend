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
    @user_game = UserGame.new(user_games_params)
    if @user_game.save
      render json: @user_game, status: :created
    else
      render json: @user_game.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @user_game = UserGame.find_by(user_id: user_games_params[:user_id], game_id: user_games_params[:game_id])
    @user_game.destroy
  end

  private

  def user_games_params
    params.permit(:user_id, :game_id, :played?)
  end
end
