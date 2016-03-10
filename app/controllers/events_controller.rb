class EventsController < ApplicationController
  def index
  	@years = Year.all
    @events = Event.all
  end

  def show
    @event = Event.friendly.find(params[:id])
    @artists = @event.artists
  end

end
