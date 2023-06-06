class FlatsController < ApplicationController
  # skip_before_action :authenticate_user!, only: :index
  before_action :authenticate_user!, only: [:new, :create]
  def index
    @flats = Flat.all
  end

  def show
    @flat = Flat.find(params[:id])
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)
    @flat.owner = current_user
    @flat.save
    redirect_to root_path

  end



  private

  def flat_params
    params.require(:flat).permit(:address, :description, :city, :price_per_night, :number_of_guests, :photo)
  end

end
