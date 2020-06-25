class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
     @offers = Offer.all.order(created_at: :desc).first(6)

  end
end
