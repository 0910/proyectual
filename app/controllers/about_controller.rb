class AboutController < ApplicationController
  def show
    @about = About.find(1)
    @events = Event.all
  end
end
