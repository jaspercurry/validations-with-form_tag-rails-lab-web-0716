class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    @post.update(post_params)

    redirect_to post_path(@post)
  end

  def create
    @post = Post.new
    @post.attributes=(post_params)

    if @post.valid?
      @post.save
      redirect_to @post

    else
      render :new
    end


  end

  def edit
    @post = Post.find(params[:id])


  end

  def update
    @post = Post.find(params[:id])
    @post.attributes=(post_params)

    if @post.valid?
      @post.save
      redirect_to @post
    else
      render :edit
    end

  end

  private

  def post_params
    params.permit(:title, :category, :content)
  end
end
