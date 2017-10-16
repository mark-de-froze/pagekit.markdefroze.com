module Slugged
  extend ActiveSupport::Concern

  included do
    friendly_id :title, use: :slugged

    validates :title, :slug, slug: true, :allow_blank => true, uniqueness: true, :on => :update
  end

  def should_generate_new_friendly_id?
    if !slug?
      title_changed?
    else
      false
    end
  end

  def normalize_friendly_id(text)
    text.to_slug.transliterate(:cyrillic).normalize.to_s
  end

end