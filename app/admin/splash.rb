ActiveAdmin.register Splash do

index do
    column :id
    column :title
    actions
  end
  
  show do |p|
    attributes_table do
      row :title
      row :subtitle
      row :call_to_action
      row :link
    end
  end

  form html: { multipart: true } do |f|
    f.inputs 'Details' do
      f.semantic_errors
      f.translated_inputs 'ignored title', switch_locale: true, available_locales: I18n.available_locales do |t|
        t.input :title, :require => true
        t.input :subtitle
        t.input :call_to_action
      end
      f.input :link
    end
    f.inputs "Image" do
      f.input :image, :as => :file, label: 'Image', hint: f.object.new_record? ? f.template.content_tag(:span, "No Image Yet") : image_tag(f.object.image.url(:thumb))
    end
    f.actions
  end

end
