ActiveAdmin.register About do

  controller do
    define_method(:index) do
      redirect_to edit_admin_about_path(1)
    end
  end
  form html: { multipart: true } do |f|
    f.inputs 'Details' do
      f.translated_inputs 'ignored title', switch_locale: true, available_locales: I18n.available_locales do |t|
        t.input :short_about
        t.input :long_about
      end
      f.input :cover, :as => :file, label: 'Cover', hint: f.object.new_record? ? f.template.content_tag(:span, "No Image Yet") : image_tag(f.object.cover.url(:thumb))
   end
  f.actions
  end
end
