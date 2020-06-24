class BarsController < ApplicationController

before_action :find_bar, only: [:show, :edit, :update, :destroy]

  # @bars = Bar.geocoded # returns bars with coordinates

def show

  @markers =
    [{
      lat: @bar.latitude,
      lng: @bar.longitude
    }]

end

  def new
    @bar = Bar.new
    authorize @bar
  end

def create
    @bar = Bar.new(bar_params)
    @bar.user = current_user
    authorize @bar
      if @bar.save!
        redirect_to bar_path(@bar)
      else
        render :new
      end
  end

def edit

end

def update

    if @bar.update(bar_params)
       @bar.save
      redirect_to @bar, notice: 'Bar was successfully updated.'
    else
      render :edit
    end
  end


def destroy

  @bar.destroy
  redirect_to root_path, notice: 'Bar was successfully destroyed.'

end





private

def find_bar
  @bar = Bar.find(params[:id])
  authorize @bar
end

def bar_params
  params.require(:bar).permit(:description, :location, :name, photos:[])
end

end
