class HomeController < ApplicationController
  def index
    @about = About.find(1)
  	@news = News.last(2)
  	@splashes = Splash.all
  	@partners = Partner.all
  	@events = Event.where(featured: 'Yes')
  end
end
