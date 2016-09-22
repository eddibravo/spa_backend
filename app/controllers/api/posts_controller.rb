class Api::PostsController < ApplicationController
  before_action :authenticate_user, :except => [:index, :show, :search]

  def index
    posts = Post.paginate(page_params).includes(:user).order_by(params[:order], params[:direction])
    render :json => posts
  end

  def search
    keyword = params[:q] || nil
    search_result = Post.paginate(page_params).search_title_like(keyword).includes(:user)
    logger.info search_result.inspect
    paginate :json => search_result
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
    post = current_user.posts.find params[:id]
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
    render :status => 204
  end


  private
  def secure_params
    params.require(:post).permit(:username, :title, :body)
  end

  def page_params
    page = params[:page].respond_to?(:to_i) && params[:page].to_i > 0 ? params[:page].to_i : 1
    per_page = params[:per_page].respond_to?(:to_i) && params[:per_page].to_i > 0 ? params[:per_page].to_i : 30

    {:page => page, :per_page => per_page}
  end
end
