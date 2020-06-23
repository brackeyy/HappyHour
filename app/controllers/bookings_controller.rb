class BookingsController < ApplicationController

  def index

    @bookings = policy_scope(Booking)
  end

  def show
    @booking = Booking.find(params[:id])
    authorize @booking
  end


  def create
    @offer = Offer.find(params[:offer_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.offer = @offer
    authorize @booking

    if @booking.save!
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
    @offer.user = current_user
    @booking.offer = @offer
    @booking = Booking.find(params[:id])
    authorize @booking
  end

  def update
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.expired = params[:status]
    @booking.save
    redirect_to "/dashboard"


  end
  # def destroy
  #   @booking = Booking.find(params[:id])
  #   @booking.delete
  #   authorize @booking
  # end

  private

  def booking_params
    params.require(:booking).permit(:expired)
  end

end
