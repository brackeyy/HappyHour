class OffersController < ApplicationController

  def index
    @offers = policy_scope(Offer)
    if params[:query].present?
      sql_query = "bars.location @@ :query"
      @offers = Offer.joins(:bar).where(sql_query, query: "%#{params[:query]}%")
    else
      @offers = Offer.all
    end

  end

  def show
    @offer = Offer.find(params[:id])
    authorize @offer
    @markers =
    [{
      lat: @offer.bar.latitude,
      lng: @offer.bar.longitude
    }]
  end

  def new
    @bar = Bar.find(params[:bar_id])
    @offer = Offer.new
    authorize @offer
  end

  def create
    @bar = Bar.find(params[:bar_id])
    @offer = Offer.new(offer_params)
    @offer.bar = @bar
    @offer.bar.user = current_user
    authorize @offer

    if current_user.counter > 2 && current_user.premium == 1
      flash.notice = "Upgrade your package mf!"
      render :new
    elsif current_user.counter > 4 && current_user.premium == 2
      flash.notice = "Upgrade your package mf!"
      render :new
    else
      if @offer.save!
        current_user.counter += 1
        current_user.save
        redirect_to @offer
      else
        render :new
      end
    end
  end

def edit

  @offer = Offer.find(params[:id])

  authorize @offer
  # /bars/:bar_id/offers/:id/edit
end

def update

  @offer = Offer.find(params[:id])
  authorize @offer
  # @offer.description = params[:offer][:description]
  # @offer.start_time = params[:offer][:start_time]
  # @offer.duration = params[:offer][:duration]
  # @offer.expired = params[:offer][:expired]
  @offer.update(offer_params)

  @offer.save
  redirect_to @offer


end

def destroy
  @offer = Offer.find(params[:id])
  @offer.delete
  authorize @offer
  redirect_to offers_path
end

private

def offer_params
  params.require(:offer).permit(:description, :start_time, :end_time, :expired)
end

end


