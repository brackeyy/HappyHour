class DashboardsController < ApplicationController  
  def show
    @bookings = current_user.bookings
    authorize @bookings
  end
end
