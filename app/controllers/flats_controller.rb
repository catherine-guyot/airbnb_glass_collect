class FlatsController < ApplicationController
  def index
    @flats = Flat.all
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.save
    redirect_to flat_path(@flat)
  end

  private

  def flat_params
    params.require(:flat).permit(:address, :city, :price_per_night, :number_of_guests)
  end
end
