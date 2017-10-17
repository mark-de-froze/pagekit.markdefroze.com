@site_links_sections.each do |section|
  json.set! section, @links[section]
end