class Menu
  def self.all
    self.build
  end

  def self.main
    if self.all.is_a?(Hash)
      menu = Hash.new
      self.all.each do |url, item|
        icon = url+'/icon.svg'

        menu[url] = {
            role: "manager_#{url.split('/').last}".to_sym,
            #title: url.split('/').last.titleize,
            title: I18n.t(url.split('/').join('.')+'.index.title'),
            icon: icon
        }
      end
      menu
    end
  end

  def self.sub(section)
    menu = Hash.new
    if self.all.is_a?(Hash) && self.all[section].is_a?(Hash)

      self.all[section].each do |url, item|
        menu[url] = {
            #title: item.titleize
            title: I18n.t(url.split('/').join('.')+'.index.title')
        }
      end
    end
    menu
  end

  private

  def self.build
    menu = Hash.new
    Rails.application.routes.routes.map do |groute|
      controller = groute.defaults[:controller].to_s
      route = groute.path.spec.to_s.gsub(/\(\.:format\)/, "").gsub(/\/:[a-zA-Z_]+/, "").gsub(/\/(new|edit)/, "")

      if controller.start_with?("admin")
        item = route.sub('/','').split('/')
        section = [item[0],item[1]].join('/')
        translate = item.last
        menu[section] = Hash.new unless menu[section].is_a?(Hash)

        menu[section][route] = translate if item.size > 2
        menu[section] = translate if item.size == 2 && menu[section].empty?
      end
      menu
    end.uniq.compact[0]
  end
end
