class AmenitiesController < ApplicationController
  def index
    @amenities = Amenity.all
  end
end
