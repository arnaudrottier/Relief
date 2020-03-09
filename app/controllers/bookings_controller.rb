class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @amenity = Amenity.find(params[:amenity_id])
    @booking = Booking.new(booking_params)
    @booking.amenity = @amenity
    @booking.user = current_user
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render "amenities/show"
    end
  end

  def destroy
    @booking = Booking.find(params[:booking_id])
    @booking.destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
