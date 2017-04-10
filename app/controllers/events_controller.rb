class EventsController < ApplicationController
  def index
    @about = About.find(1)
  	@years = Year.all.order(name: :desc)
  	@events = Event.all.order(year: :desc)
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
    @event = Event.friendly.find(params[:id])
    @events = @event.events
    @artists = @event.artists
    set_meta_tags(
      title: "Proyetual - #{@event.name}",
      description: @event.description,
      keywords: "festivals, barcelona, festivales, house, disco, techno, open, air, day, events",
      og: {
        title: "Proyetual - #{@event.name}",
        type:'website',
        url: "www.proyectual.info",
        description: @event.description 
      }
    )
  end

end
