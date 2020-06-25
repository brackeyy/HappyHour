class DashboardsController < ApplicationController
  def show
    @offers = Offer.joins(:bar).where(user: current_user)
    @bookings = Booking.where(user: current_user)
    @bars= Bar.where(user: current_user)
  end
end
