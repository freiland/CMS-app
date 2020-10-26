class CommentsController < ApplicationController
  before_action except: [:new, :create, :show] do 
    unless is_admin? || is_creator?
      flash[:alert] = 'You do not have access to this content.' 
      redirect_to posts_path
      end
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