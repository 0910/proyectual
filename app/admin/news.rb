ActiveAdmin.register News do
  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end 
  index do
    column :id
    column :date
    column :title
    column :slug
    actions
  end
  
  show do |p|
    attributes_table do
      row :title
      row :slug
      row :date
      row :body
      p.images.each do |image|
        row :image do
          image_tag(image.file.url(:thumb))
        end
      end
    end
  end

  form html: { multipart: true } do |f|
    f.inputs 'Details' do
      f.semantic_errors
      f.input :date, :as => :datepicker
      f.translated_inputs 'ignored title', switch_locale: true, available_locales: I18n.available_locales do |t|
        t.input :title, :require => true
        t.input :body
      end
    end
    f.inputs "Images" do
      f.has_many :images do |i|
        i.input :file, as: :file, label: false, hint: i.object.new_record? ? i.template.content_tag(:span, "No Image Yet") : image_tag(i.object.file.url(:thumb))
        i.input :cover, as: :boolean, label: "Cover"
        i.input :_destroy, as: :boolean, label: "Destroy?" unless i.object.new_record?
      end 
    end
    f.actions
  end

end
