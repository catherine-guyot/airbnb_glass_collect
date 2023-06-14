class FlatsController < ApplicationController
  # skip_before_action :authenticate_user!, only: :index
  before_action :authenticate_user!, only: [:new, :create]
  def index
    if params[:query].present?
      # @query = params[:query]
      # @query_guest = params[:query_guest]
      @flats = Flat.where("city ILIKE ?", "%#{params[:query]}%")
      # Preventing SQL Injection and Database error for
      # unknown characters
    else
      @flats = Flat.all
    end
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
    redirect_to flat_path(@flat)
  end

  def destroy
    @flat = Flat.find(params[:id])
    @flat.destroy
    redirect_to root_path, status: :see_other
  end


  private

  def flat_params
    params.require(:flat).permit(:address, :description, :city, :price_per_night, :number_of_guests, :photo)
  end

end
