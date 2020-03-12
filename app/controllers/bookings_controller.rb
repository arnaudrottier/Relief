class BookingsController < ApplicationController
  def create
    @booking = Booking.new(booking_params)
    @amenity = Amenity.find(params[:amenity_id])
    @booking.room = current_user.room
    @booking.amenity = @amenity
    if @booking.save
      respond_to do |format|
        format.html { redirect_to my_house_path, notice: "Successfully Booked #{@booking.amenity.name}" }
        format.js
      end
    else
      @amenities = Amenity.all
      respond_to do |format|
        format.html { render "amenities/index" }
        format.js
      end
    end
  end

  private
  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

end
