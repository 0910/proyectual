class NewsController < ApplicationController
  def index
  end

  def show
  end

  def news
    News.find_by_slug!(news_id) if news_id.present?
  end

  helper_method :news

  def news_id
  	params[:id]
  end
end
