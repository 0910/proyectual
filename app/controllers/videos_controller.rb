class VideosController < ApplicationController
  def show
  end

  def index
  end

  def video
    Video.find_by_slug!(video_id) if video_id.present?
  end

  helper_method :video

  def video_id
  	params[:id]
  end
end
