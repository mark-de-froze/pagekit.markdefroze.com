@site_settings.sections.each do |section|
  json.set! section.slice(0), @settings[section.slice(0)]
end