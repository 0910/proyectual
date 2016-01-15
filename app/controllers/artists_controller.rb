class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.friendly.find(params[:id])
    @events = Event.joins(:event_artists).where(:event_artists => {:artist_id => @artist})
  end

end