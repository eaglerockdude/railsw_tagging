class PostsController < ApplicationController

  before_action :require_user, only: [:new, :create]

  def index
    if params[:tag]
      @posts = Post.tagged_with(params[:tag])
      params[:tag] = nil
    else
      @posts = Post.all
    end
  end

  def create
    @post = Post.new(post_params)

      if @post.save
        flash[:notice]  = "Post was created successfully."
        redirect_to root_path
      end

  end

  private
  def post_params
    params.require(:post).permit(:author, :content, :all_tags)
  end
end
