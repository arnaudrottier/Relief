class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @booking.room = current_user.room
    @booking.amenity = Amenity.find(params[:amenity_id])
    if @booking.save
      redirect_to my_house_path, notice: "Successfully Booked #{@booking.amenity.name}"
    else
      @amenities = Amenity.all
      render "amenities/index"
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
