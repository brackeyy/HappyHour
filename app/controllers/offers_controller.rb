class OffersController < ApplicationController

 def index

  @offers = policy_scope(Offer)
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
    redirect_to bar_offer_path(@bar, @offer)
  else
    render :new
  end
end

def edit
  @bar.user = current_user
  @offer.bar = @bar
  @offer = Offer.find(params[:id])
  authorize @offer
end

def update

  @offer = Offer.find(params[:id])
  authorize @Offer
  @offer.description = params[:description]
  @offer.start_time = params[:start_time]
  @offer.duration = params[:duration]


  @offer.save
  redirect_to "/"


end

def destroy
  @offer = Offer.find(params[:id])
  @offer.delete
  authorize @offer
end

private

def offer_params
  params.require(:offer).permit(:description, :start_time, :duration)
end

end


