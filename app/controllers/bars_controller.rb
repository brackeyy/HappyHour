class BarsController < ApplicationController

before_action :find_bar, only: [:show, :edit, :update, :destroy]

def index
  @bars = Bar.geocoded # returns flats with coordinates

  @markers = @bars.map do |bar|
    {
      lat: flat.latitude,
      lng: flat.longitude
    }
  end
end

def show
  @bar = Bar.find(params[:id])
  @markers =
    [{
      lat: @bar.latitude,
      lng: @bar.longitude
    }]
end


  def new
    @bar = Bar.new
  end

def create
    @bar = Bar.new(bar_params)
    @bar.user = current_user
    # authorize @bar
      if @bar.save!
        redirect_to bar_path(@bar)
      else
        render :new
      end
  end

def edit


  # authorize @booking
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
end

def bar_params
  params.require(:bar).permit(:description, :location, :name, pictures:[])
end

end
