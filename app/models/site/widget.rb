class Site::Widget < ApplicationRecord
  include Keyable
  include Searchable

  STATUSES = [ :enabled, :disabled ]
  include Statusable

  POSITIONS = [ :navbar, :hero, :top, :sidebar, :bottom, :footer, :offcanvas ]
  enum position: POSITIONS

  validates :title, :section, presence: true

  def position_text(val = nil)
     val = self.position if val.nil?
    I18n.t("simple_form.options.site_widget.position.#{position.to_s}", default: val.to_s.humanize)
  end

  def positions
    POSITIONS
  end

  def positions_with_count
    positions_count = Hash.new
    POSITIONS.each do |position|
      positions_count[self.position_text(position.to_s)] = Site::Widget.unscoped.where(position: position.to_s.downcase).size
    end

    positions_count
  end

  resourcify
end
