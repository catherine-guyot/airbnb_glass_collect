class BookingsController < ApplicationController
  before_action :authenticate_user!
  def index
    @booking = Booking.all
  end

  def new
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.new
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def create
    @flat = Flat.find(params[:flat_id])
    @booking = Booking.new(booking_params)
    @booking.flat = @flat
    @booking.user = current_user
    @booking.status = "A valider"
    @booking.save
    redirect_to flat_booking_path(@flat, @booking)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status, :booking_price)
  end
end
