module Imageable
  extend ActiveSupport::Concern

  included do
    validates :image, url: true, :allow_blank => true
  end

  def image_url
    image.blank? ? 'placeholder-800x600.svg' : image
  end

end