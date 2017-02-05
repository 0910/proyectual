class EventsController < ApplicationController
  def index
  	@years = Year.all
    @events = Event.all
  end

  def show
    @event = Event.friendly.find(params[:id])
    @events = @event.events
    @artists = @event.artists
  end

end
