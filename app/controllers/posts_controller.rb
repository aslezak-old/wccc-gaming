class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :destroy, :create, :update, :new]

  def new
    @post = Post.new
  end

  def index
    @pagi = Post.paginate(:page => params[:page], :per_page => 3, :order => 'created_at desc')
    @events = Post.where('is_event = "t"')
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

def destroy
  @post = Post.find(params[:id])
  @post.destroy

  redirect_to posts_path
end

  def show
    @post = Post.find(params[:id])
  end

private
  def post_params
    params.require(:post).permit(:title, :text)
  end
end
