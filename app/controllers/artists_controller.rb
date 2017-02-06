class ArtistsController < ApplicationController
  def index
    @artists = {}
    Artist.all.each do |artist|
      letter = artist.name.slice(0,1).upcase
      @artists[letter] ||= []
      @artists[letter] << artist 
    end
  end

  def show
    @artist = Artist.friendly.find(params[:id])
    @events = Event.joins(:event_artists).where(:event_artists => {:artist_id => @artist})
    @soundcloud_user = @artist.soundcloud.sub("https://soundcloud.com/",'')
  end

end
