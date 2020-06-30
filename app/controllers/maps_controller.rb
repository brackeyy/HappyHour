class MapsController < ApplicationController
  def index
    @bars = policy_scope(Bar.geocoded) # returns flats with coordinates
    @offers = Offer.all
    @markers = @offers.map do |offer|
      {
        lat: offer.bar.latitude,
        lng: offer.bar.longitude,
        infoWindow: render_to_string(partial: "maps/info_window", locals: { offer: offer }),
        image_url: helpers.asset_url('MARKER.png')
      }

    end
  end
end
