class DashboardsController < ApplicationController  
  def show
    @offers = Offer.where(user: current_user)
    @bookings = Booking.where(user: current_user)
    @bars= Bar.where(user: current_user)
  end
end
