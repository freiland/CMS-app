class CommentsController < ApplicationController
  before_action :authenticate_user!, :only => [:new]
  before_action :only => [:edit, :destroy] do
    redirect_to new_user_session_path unless current_user && current_user.admin
  end


  def new
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new
    render :new
  end

  def show
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    render :show
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_path(@comment.post)
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to post_path(@comment.post)
    else
      render :edit
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    render :edit
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    if @comment.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end


  private
    def comment_params
      params.require(:comment).permit(:author, :comment_body)
    end
end