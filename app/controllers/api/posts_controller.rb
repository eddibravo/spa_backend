class Api::PostsController < ApplicationController
  before_action :authenticate_user, :except => [:index, :show]
  def index
    render :json => Post.order(:id => :asc)
  end

  def create
    post = current_user.posts.new secure_params
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
    post = current_user.find params[:id]
    post.update_attributes secure_params
    if post.save
      render :json => post
    else
      render :status => :unprocessable_entity, :json => post.errors
    end
  end

  def destroy
    post = current_user.posts.find params[:id]
    post.destroy
    render :status => :ok
  end


  private
  def secure_params
    params.require(:post).permit(:username, :title, :body)
  end
end
