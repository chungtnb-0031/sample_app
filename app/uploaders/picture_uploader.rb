class PictureUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  process resize_to_limit: [Settings.resize_to_limit.col, Settings.resize_to_limit.row]

  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def extension_whitelist
    %w(jpg jpeg gif png)
  end
end
