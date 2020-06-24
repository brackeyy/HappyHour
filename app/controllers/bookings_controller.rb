class BookingsController < ApplicationController

  def index
    @bookings = Booking.where(user: current_user)
    @bookings = policy_scope(Booking)
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
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
