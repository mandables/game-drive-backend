class Api::V1::ReviewsController < ApplicationController

    def index
        @reviews = Review.all
        render json: @reviews
      end

      def show
        @review = Review.find(params[:id])
        render json: @review
      end
    
      def create
        @review = Review.create(params)
      end

      private

      def reviews_params
        params.permit(:user_id, :game_id, :content, :rating)
      end


end
