class ImagePreviewInput < SimpleForm::Inputs::StringInput
  def input(wrapper_options=nil)
    out = ''
    if object.send("#{attribute_name}?")
      obj = object.send(attribute_name)
      out << template.link_to('', obj, class: 'uk-margin-top uk-form-icon uk-form-icon-flip', 'uk-icon': 'icon: image')
    end
    out << super

    out = template.content_tag(:div, out.html_safe, class: 'uk-width-1-1 uk-inline', 'uk-lightbox': true)
    out.html_safe
  end
end