@site_settings.sections.each do |section|
  json.set! section.slice(0) do
    @site_settings.each do |setting|
      if setting.section == section.slice(0)
        json.set! setting.key, setting.value
      end
    end
  end
end