class ArtistsController < ApplicationController
  def index
    @about = About.find(1)
    @artists = {}
    Artist.all.each do |artist|
      letter = artist.name.slice(0,1).upcase
      @artists[letter] ||= []
      @artists[letter] << artist 
    end
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
    @artist = Artist.friendly.find(params[:id])
    @events = Event.joins(:event_artists).where(:event_artists => {:artist_id => @artist})
    set_meta_tags(
      title: "Proyetual - #{@artist.name}",
      description: @artist.body,
      keywords: "festivals, barcelona, festivales, house, disco, techno, open, air, day, events",
      og: {
        title: "Proyetual - #{@artist.name}",
        type:'website',
        url: "www.proyectual.info",
        description: @artist.body 
      }
    )
  end

end
