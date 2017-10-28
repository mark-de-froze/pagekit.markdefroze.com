@site_widgets.positions.each do |position|
  json.set! position.slice(0) do
    @site_widgets.each do |widget|
      if widget.position == position.slice(0)
        json.set! widget.section do
          json.extract! widget, :id, :title, :subtitle, :content, :section, :created_at, :updated_at
          json.content widget.content.gsub(/{{widget.title}}/,widget.title).gsub(/{{widget.subtitle}}/,widget.subtitle)
        end
      end
    end
  end
end