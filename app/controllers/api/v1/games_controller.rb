class Api::V1::GamesController < ApplicationController
  def index
    @games = Game.all
    render json: @games
  end

  def show
    @game = Game.find(params[:id])
    render json: @game
  end

  def create 
    byebug
  end 

  private 

  def game_params
    params.require(:game).permit(:title, :img_url, :rawg_id, :description)
  end 
end
