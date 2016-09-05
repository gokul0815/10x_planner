class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update]
  before_action :authenticate_user!

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def show
  end

  def new
    @post = Post.new
  end


  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "You've successfuly created post!"
      redirect_to @post
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render "edit"
    end
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:day, :goals_first, :quote_of_the_day, :targets, :successes, :goals_second)
  end

end
