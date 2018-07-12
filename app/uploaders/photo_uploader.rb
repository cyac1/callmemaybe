class PhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave

  process eager: true  # Force version generation at upload time.

  process convert: 'jpg'

  version :thumbnail do
    resize_to_fit 256, 256
  end

  version :profile_lg do
      cloudinary_transformation crop: :fill, height: 500, width: 500, gravity: :face, quality: :auto
  end

  version :bright_face do
    cloudinary_transformation effect: "brightness:30", radius: 20,
      width: 150, height: 150, crop: :thumb, gravity: :face
  end
end
