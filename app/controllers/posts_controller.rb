class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :owned_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = current_user.posts.order("created_at DESC").paginate(page: params[:page])
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

  def destroy
    @post.destroy
    flash[:success] = "You've successfuly deleted post"
    redirect_to posts_path
  end

  private

  def find_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:day, :goals_first, :quote_of_the_day, :targets, :successes, :goals_second)
  end

  def owned_post
    unless current_user == @post.user
      flash[:alert] = "That doesn't belong to you!"
      redirect_to root_path
    end
  end

end
