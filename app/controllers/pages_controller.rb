class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
     @offers = Offer.all.order(created_at: :desc).first(6)
    @most_populars = Offer.all.left_joins(:bookings).group(:id).order('COUNT(bookings.id) DESC').limit(6)
  end
end
