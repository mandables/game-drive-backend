# frozen_string_literal: true

module API
  module V1
    class UsersController < ApplicationController
      def index
        @users = User.all
        render json: @users
      end

      def signin
        @user = User.find_by(username: params[:username])
        if @user&.authenticate(params[:password])
          render json: { username: @user.username, user_id: @user.id, token: issue_token(id: @user.id) }
        else
          render json: { error: 'Username/password combination invalid.' }, status: 401
        end
      end

      def validate
        @user = get_current_user
        if @user
          render json: { username: @user.username, user_id: @user.id, token: issue_token(id: @user.id) }
        else
          render json: { error: 'Username/password combination invalid.' }, status: 401
        end
      end

      def games
        @user = get_current_user
        if @user
          render json: @user.games
        else
          render json: { error: 'Not a valid user' }, status: 401
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
  end
end
