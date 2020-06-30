class MapsController < ApplicationController
  def index
    @bars = policy_scope(Bar.geocoded) # returns flats with coordinates
    @offers = Offer.all
    @markers = @offers.map do |offer|
      {
        lat: offer.bar.latitude,
        lng: offer.bar.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { offer: offer })
      }
    end
  end
end
