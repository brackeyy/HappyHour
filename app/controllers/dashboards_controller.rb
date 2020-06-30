class DashboardsController < ApplicationController
  def show
    @offers = policy_scope(Offer)
    @bookings = current_user.bookings
    @bars = policy_scope(Bar)
    @bars = current_user.bars
    # @bars = @bars.where(current_user == @bar.user)
    authorize @bookings
  end

end
