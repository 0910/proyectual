class EventsController < ApplicationController
  def index
  end

  def show
  end

  def event
    Event.find_by_slug!(event_id) if event_id.present?
  end

  helper_method :event

  def event_id
  	params[:id]
  end
end
