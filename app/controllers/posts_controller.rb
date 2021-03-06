class PostsController < ApplicationController
  before_action :only => [:new, :edit] do 
    unless is_admin?
      flash[:alert] = 'You do not have access to this content.'
      redirect_to posts_path 
      end
  end

  def require_admin
    if !current_user.admin?
      redirect_to benefits_path
    end
  end

  def index
    @posts = Post.all
    render :index
  end

  def new
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    render :edit
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  def update
    @post= Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if current_user.admin?
      @post.destroy
    else
      flash[:alert] = 'You do not have access to this content.'
    end
    redirect_to posts_path
  end

  private
    def post_params
      params.require(:post).permit(:subject, :content_body)
    end

  end