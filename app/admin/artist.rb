ActiveAdmin.register Artist do

  csv_importable :columns => [:name, :website, :facebook, :resident_advisor, :soundcloud], :import_unique_key => :code

  csv do
    column :name
    column :resident_advisor
    column :facebook
    column :soundcloud
  end

  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end 
  index do
    column :id
    column :name
    column :slug
    actions
  end
  
  show do |p|
    attributes_table do
      row :name
      row :slug
      row :website
      row :facebook
      row :resident_advisor
      row :soundcloud
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
      f.input :name, :require => true
      f.input :website
      f.input :facebook
      f.input :resident_advisor
      f.input :soundcloud
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
