class MapsController < ApplicationController
  def index
    @bars = policy_scope(Bar.geocoded) # returns flats with coordinates
    @offers = Offer.all
    @markers = @offers.select{|offer| offer.end_time > DateTime.now &&  DateTime.now > offer.start_time}.map do |offer|
      {
        lat: offer.bar.latitude,
        lng: offer.bar.longitude,
        infoWindow: render_to_string(partial: "maps/info_window", locals: { offer: offer }),
        image_url: helpers.asset_url('MARKER.png'),
        end_time: offer.end_time
      }

    end
  end
end
