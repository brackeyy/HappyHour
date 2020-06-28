class DashboardsController < ApplicationController
  def show
    @offers = policy_scope(Offer)
    @bookings = current_user.bookings
    authorize @bookings
  end
end
