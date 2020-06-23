# frozen_string_literal: true

module API
  module V1
    class ReviewsController < ApplicationController
      def index
        @reviews = Review.all
        render json: @reviews
      end

      def show
        @review = Review.find(params[:id])
        render json: @review
      end

      def create
        @review = Review.new(reviews_params)
        if @review.save
          render json: @review, status: :created
        else
          render json: @review.errors, status: :unprocessable_entity
        end
      end

      private

      def reviews_params
        params.permit(:user_id, :game_id, :content, :rating, :username)
      end
    end
  end
end
