class ArtistsController < ApplicationController
  def index
  end

  def show
  end

  def artist
    Artist.find_by_slug!(artist_id) if artist_id.present?
  end

  helper_method :artist

  def artist_id
  	params[:id]
  end

end