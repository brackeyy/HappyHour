class Offer < ApplicationRecord
  belongs_to :bar
  has_many :bookings, dependent: :destroy

 def show
  @markers =
    [{
      lat: @flat.latitude,
      lng: @flat.longitude
    }]
    authorize @flat

end


end
