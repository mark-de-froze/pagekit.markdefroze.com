class Api::V1::Site::WidgetsController < ApiController

  def index
    @widgets = Hash.new
    @site_widgets = Site::Widget.api(@api_key)

    @site_widgets.each do |widget|
      @widgets[widget.position] = Array.new unless @widgets[widget.position].is_a?(Array)
      @widgets[widget.position] << widget
    end
  end
end