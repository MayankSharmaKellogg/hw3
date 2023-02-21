class PostsController < ApplicationController
    def new
      @place = Place.find(params[:place_id])
      @post = Post.new(place_id: @place.id)
    end
  
    def create
      @place = Place.find(params[:place_id])
      @post = @place.posts.new(post_params)
      if @post.save
        redirect_to @place, notice: 'Post was successfully created.'
      else
        render :new
      end
    end
  
    private
  
    def post_params
      params.require(:post).permit(:title, :description, :date)
    end
  end
