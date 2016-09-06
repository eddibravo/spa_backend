class Api::PostsController < ApplicationController

  def index
    render :json => Post.order(:id => :asc)
  end

  def create
    post = Post.new secure_params
    if post.save
      render :status => :created, :json => post
    else
      render :status => :unprocessable_entity, :json => post.errors
    end
  end

  def show
    render :json => Post.find(params[:id])
  end

  def update
    post = Post.find params[:id]
    post.update_attributes secure_params
    if post.save
      render :json => post
    else
      render :status => :unprocessable_entity, :json => post.errors
    end
  end

  def destroy
    Post.destroy params[:id]
    render :status => :ok
  end


  private
  def secure_params
    params.require(:post).permit(:username, :title, :body)
  end
end
