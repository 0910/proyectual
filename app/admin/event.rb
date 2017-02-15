ActiveAdmin.register Event do
  controller do
    def find_resource
      scoped_collection.friendly.find(params[:id])
    end
  end 
  index do
    column :id
    column :name
    column :slug
    column :year
    column 'Featured', :sortable => :featured do |resource|
      column_select(resource, :featured, ["Yes", "No"])
    end
    actions
  end
  
  show do |p|
    attributes_table do
      row :name
      row :slug
      row :year
      row :subtitle
      row :description
      row :facebook
      row :instagram
      row :twitter
      row :youtube
      row :video
      row :featured
      row :artists do 
        event.artists.collect.each do |a|
          a.name
        end
      end
      row :events do 
        event.events.collect.each do |a|
          a.name
        end
      end
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
      f.input :subtitle, :require => true
      f.input :year, :as => :select
      f.input :featured, :as => :select, :collection => ['No', 'Yes'], :include_blank => false
      f.translated_inputs 'ignored title', switch_locale: true, available_locales: I18n.available_locales do |t|
        t.input :description
      end
      f.input :facebook
      f.input :instagram
      f.input :twitter
      f.input :youtube
      f.input :video
      f.input :video_cover, :as => :file, label: 'Video Cover', hint: f.object.new_record? ? f.template.content_tag(:span, "No Image Yet") : image_tag(f.object.video_cover.url(:thumb))
      f.input :artists, :as => :select, :collection => Artist.all, :include_blank => false, :require => true, :multiple => true
      f.input :events, :as => :select, :collection => Event.all, :include_blank => false, :require => true, :multiple => true
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
