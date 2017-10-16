module Sluggable
  extend ActiveSupport::Concern

  included do
    extend FriendlyId

    friendly_id :title, use: :slugged

    validates :title, presence: true
    validates :slug, slug: true, :allow_blank => true, uniqueness: true, :on => :update

    def should_generate_new_friendly_id?
      slug.nil? || title_changed? || new_record?
    end

    def normalize_friendly_id(text)
      text.to_slug.transliterate(:cyrillic).normalize.to_s
    end
  end
end