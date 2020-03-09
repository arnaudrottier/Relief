class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @booking.room = current_user.room
    @booking.amenity = Amenity.find(params[:amenity_id])
    if @booking.save
      redirect_to my_house_path
    else
      @amenities = Amenity.all
      render "amenities/index"
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:start_time, :end_time)
  end
end
