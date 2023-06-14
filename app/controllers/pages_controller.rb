class PagesController < ApplicationController
  before_action :authenticate_user!,

  def home

  end

  def dashboard
    @bookings = current_user.bookings
    @flats = current_user.flats
  end

end
