class HomeController < ApplicationController
  def index
  	@news = News.all
  	@events = Event.where(featured: 'Yes')
  end
end
