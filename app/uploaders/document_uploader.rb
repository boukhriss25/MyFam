class DocumentUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
  include FileHelper
  process eager: true # Force version generation at upload time.

  version :thumb do
    storage :file
    begin
      process convert: 'jpg' # this should do the trick but doesn't
      process resize_to_fill: [160, 160]
    rescue Exception => e
      puts e.inspect
      true
    end
  end

  def image?(new_file)
    is_image?(self)
  end

  def set_content_type(*args)
    file.instance_variable_set(:@content_type, "image/jpg")
  end
end
