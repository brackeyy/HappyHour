class BookingsController < ApplicationController

  def index
    @bookings = policy_scope(Booking)
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def new
    @booking = Booking.new
    authorize @booking
  end

  def create
    @offer = Offer.find(params[:offer_id])
    @booking = Booking.new
    @booking.user = current_user
    @booking.offer = @offer
    authorize @booking

    if @booking.save!
      redirect_to dashboard_path
    else
      render :new
    end
  end

end
