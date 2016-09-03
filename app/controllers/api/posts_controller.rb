class Api::PostsController < ApplicationController

  def index
    render :json => Post.all
  end

  def create
    Post.create! secure_params
    render :status => :created
  end

  def show
    render :json => Post.find(params[:id])
  end

  def update
    Post.update params[:id], secure_params
    render :status => :ok
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
