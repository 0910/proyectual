class HomeController < ApplicationController
  def index
  	@news = News.last(2)
  	@splashes = Splash.all
  	@events = Event.where(featured: 'Yes')
  end
end
