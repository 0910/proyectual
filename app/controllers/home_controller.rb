class HomeController < ApplicationController
  def v2
    @about = About.find(1)
  	@news = News.last(2)
  	@splashes = Splash.all
  	@partners = Partner.all
  	@events = Event.where(featured: 'Yes')
    render 'index'
  end
  def index
    redirect_to "https://www.facebook.com/proyectual"
  end
end
