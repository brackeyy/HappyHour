class MapsController < ApplicationController
  def index
    @bars = policy_scope(Bar.geocoded) # returns flats with coordinates
  
    @markers = @bars.map do |bar|
      {
        lat: bar.latitude,
        lng: bar.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { bar: bar })
      }
    end
  end
end
