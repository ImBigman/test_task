# frozen_string_literal: true

  class PostsController < ApplicationController

    # GET /posts
    def index
      @posts = Posts.all

      render json: @posts, each_serializer: PostSerializer, status: :ok
    end

  # POST /posts
    def create
      context = ::Posts::Create.call(params: post_params)

      if context.success?
        render json: context.post, status: :created
      else
        render json: { errors: [context.error] }, status: :unprocessable_entity
      end
    end

    private

    def post_params
      params.require(:post).permit(:author, :title, :body)
    end
  end
