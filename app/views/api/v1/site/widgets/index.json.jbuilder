@site_widgets.positions.each do |position|
  json.set! position.slice(0), @widgets[position.slice(0)]
end