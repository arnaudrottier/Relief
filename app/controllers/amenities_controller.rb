class AmenitiesController < ApplicationController
  def index
    @amenities = Amenity.all
    @booking = Booking.new
  end

end
