class HomeController < ApplicationController
  def v2
    @about = About.find(1)
  	@news = News.last(2)
  	@splashes = Splash.all
  	@partners = Partner.all
  	@events = Event.where(featured: 'Yes')
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
    render 'index'
  end
  def index
    redirect_to "https://www.facebook.com/proyectual"
  end
end
