@site_links_sections.each do |section|
  json.set! section do
    json.array! @site_links do |link|
      if link.section == section
        json.extract! link, :id, :title, :url, :section, :is_visible_main, :is_visible_offcanvas, :created_at, :updated_at
      end
    end
  end
end