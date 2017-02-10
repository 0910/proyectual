ActiveAdmin.register Partner do
  form html: { multipart: true } do |f|
    f.inputs 'Details' do
      f.input :name
      f.input :link
      f.input :logo, :as => :file, label: 'Logo', hint: f.object.new_record? ? f.template.content_tag(:span, "No Image Yet") : image_tag(f.object.logo.url(:thumb))
    end
    f.actions
  end
end
