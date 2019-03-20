class Api::V1::UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def signin
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
     
      render json: {username: @user.username, token: issue_token({id: @user.id})}
    else
      render json: {error: "Username/password combination invalid."}, status: 401
    end
  end

  def validate
    @user = get_current_user
    if @user
      render json: {username: @user.username, token: issue_token({id: @user.id})}
    else
      render json: {error: "Username/password combination invalid."}, status: 401
    end
  end

  def get_games
    @user = get_current_user
    if @user
      render json: @user.games
    else
      render json: {error: "Not a valid user"}, status: 401
    end
  end

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def create
    @user = User.create(params)
  end
end
