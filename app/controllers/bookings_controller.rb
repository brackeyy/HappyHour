class BookingsController < ApplicationController

  def index
    @bookings = Booking.where(user: current_user)
    @bookings = policy_scope(Booking)
  end

  def show
    #@booking = Booking.find(params[:id])


    @booking = Booking.find(params[:id])
    @offer = Offer.find(params[:offer_id])
    authorize @booking

    @code = @booking.code

    @qrcode = RQRCode::QRCode.new("http://happi-hour.herokuapp.com/offers/#{@offer.id}/bookings/#{@booking.id}/confirm")

    @svg = @qrcode.as_svg(
      offset: 0,
      color: '000',
      shape_rendering: 'crispEdges',
      module_size: 6
      )

    @markers =
    [{
      lat: @offer.bar.latitude,
      lng: @offer.bar.longitude
    }]

  end

  def confirm
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.claimed = true
    @booking.save!
  end

  def create
    @offer = Offer.find(params[:offer_id])
    @booking = Booking.new
    @booking.user = current_user
    @booking.offer = @offer
    authorize @booking

    if @booking.save!
      redirect_to offer_booking_path(@offer, @booking)
    else
      render :new
    end
  end

end
