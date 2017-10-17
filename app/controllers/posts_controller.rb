class PostsController < ApplicationController

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      flash[:success] = 'Your post has been created.'
      redirect_to @post
    else
      flash[:alert] = 'Halt, you fiend! You need an image to post here!'
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)

    if @post.save
      flash[:success] = 'Post updated hombre'
      redirect_to @post
    else
      flash[:alert] = 'Something went wrong. Try again.'
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])

    if @post.destroy
      flash[:success] = 'Problem solved! Post deleted.'
      redirect_to root_path
    else
      flash[:alert] = 'Something went wrong. Try again.'
      render :edit
    end
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end

end
