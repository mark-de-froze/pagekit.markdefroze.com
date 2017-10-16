class FileUploader < CarrierWave::Uploader::Base
  include CarrierWaveDirect::Uploader

  def store_dir
    "uploads"
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end
end
