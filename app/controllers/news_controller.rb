class NewsController < ApplicationController
  def index
    @about = About.find(1)
  	@news = News.all.order(date: :desc)
    set_meta_tags(
      title: "Proyetual",
      description: @about.short_about,
      keywords: "festivals, barcelona, festivales, house, disco, techno, open, air, day, events",
      og: {
        title: "Proyetual",
        type:'website',
        url: "www.proyectual.info",
        description: @about.short_about,
      }
    )
  end

  def show
    @news = News.friendly.find(params[:id])
    set_meta_tags(
      title: "Proyetual - #{@news.title}",
      description: @news.body,
      keywords: "festivals, barcelona, festivales, house, disco, techno, open, air, day, events",
      og: {
        title: "Proyetual - #{@news.title}",
        type:'website',
        url: "www.proyectual.info",
        description: @news.body 
      }
    )
  end
end
