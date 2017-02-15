class AboutController < ApplicationController
  def show
    @about = About.find(1)
    @events = Event.all
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
end
