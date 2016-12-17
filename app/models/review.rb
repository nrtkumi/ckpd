class Review < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  def set_image(file)
    if !file.nil?
      file_name = file.original_filename
      type = extension_image(file_name)
      file_name = SecureRandom.urlsafe_base64 + type
      File.open("public/review_images/#{file_name}", 'wb'){|f| f.write(file.read)}
      self.image = file_name
    end
  end

  def extension_image(name)
    extension = File.extname(name).downcase
    case extension
    when ".jpg"
      return ".jpg"
    when ".jpeg"
      return ".jpeg"
    when ".png"
      return ".png"
    when ".gif"
      return ".gif"
    end
  end
end
