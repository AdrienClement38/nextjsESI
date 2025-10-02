module Api
  class PostsController < ApplicationController
    def index
      posts = Post.includes(:user).all
      render json: posts.as_json(include: { user: { only: [:id, :name, :email] } })
    end

    def show
      post = Post.includes(:user).find(params[:id])
      render json: post.as_json(include: { user: { only: [:id, :name, :email] } })
    rescue ActiveRecord::RecordNotFound
      render json: { error: 'Post not found' }, status: :not_found
    end
  end
end
