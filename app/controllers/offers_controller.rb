class OffersController < ApplicationController

  def show
    @bar = Bar.find(params[:id])
    @markers =
      [{
        lat: @bar.latitude,
        lng: @bar.longitude
      }]
  end



end
