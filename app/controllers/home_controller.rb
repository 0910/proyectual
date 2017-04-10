class HomeController < ApplicationController
  def index
    @about = About.find(1)
  	@news = News.all.order(date: :desc).last(2)
  	@splashes = Splash.all.order(id: :desc)
  	@partners = Partner.all
  	@events = Event.where(featured: 'Yes').order(:year :desc)
    set_meta_tags(
      title: "Proyetual",
      description: @about.short_about,
      keywords: "festivals, barcelona, festivales, house, disco, techno, open, air, day, events",
      og: {
        title: Proyectual,
        type:'website',
        url: "www.proyectual.info",
        description: @about.short_about 
      }
    )
  end
end
