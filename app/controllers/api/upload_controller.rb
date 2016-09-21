class Api::UploadController < ApplicationController
	 before_action :authenticate_user
	def index
		image = params[:image]
		uploader = FileUploader.new
		uploader.store! image.tempfile

    logger.info uploader.inspect
    render :json => {:url => uploader.url, :thumb => uploader.thumb.url, :small_thumb => uploader.small_thumb.url}, :status => :created
  rescue => ex
    logger.error ex.message
		render :json => {:error => ex.message}, :status => :unprocessable_entity
	end
end
