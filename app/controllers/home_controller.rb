class HomeController < ApplicationController
  def index
  	@news = News.all
  	@splashes = Splash.all
  	@events = Event.where(featured: 'Yes')
  end
end
