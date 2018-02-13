class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
  end

  def new
    @subs = Sub.all
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
  
    if @post.save 
      redirect_to post_url(@post)
    else 
      flash.now[:errors] = @post.errors.full_messages 
      render :new 
    end 
  end

  def edit
    @subs = Sub.all
    @post = current_user.posts.find(params[:id])
  end

  def update
    @post = current_user.posts.find(params[:id])
    
    if @post.update(post_params)
      redirect_to post_url(@post)
    else 
      flash.now[:errors] = @post.errors.full_messages
      render :edit 
    end 
  end

  def destroy
    post = Post.find(params[:id])
    if post 
      post.delete 
      redirect_to subs_url 
    end 
  end
  
  private 
  
  def post_params 
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end 
end
