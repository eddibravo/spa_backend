class FileUploader < CarrierWave::Uploader::Base
	include CarrierWave::MiniMagick
	include CarrierWave::BombShelter

	storage :file

	def extension_white_list
		%w(jpg jpeg gif png bmp)
  end

  process :convert => 'png'

  version :thumb do
    process resize_to_fill: [200, 200]
  end

  version :small_thumb, from_version: :thumb do
    process resize_to_fill: [20, 20]
  end

	def filename
		"#{SecureRandom.uuid}.#{file.extension}" if original_filename.present?
	end
end
