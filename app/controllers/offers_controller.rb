class OffersController < ApplicationController

 def index
  if params[:query].present?
      sql_query = " \
        offers.bar.location @@ :query \
      "
      @offers = Offer.where(sql_query, query: "%#{params[:query]}%")
  @offers = policy_scope(Offer)
else
  @offers = Offer.all
  @offers = policy_scope(Offer)

end

end

def show
  @offer = Offer.find(params[:id])
  authorize @offer
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

  if @offer.save!
    #redirect_to offer_path(@offer)
    redirect_to @offer
  else
    render :new
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
  params.require(:offer).permit(:description, :start_time, :duration, :expired)
end

end


