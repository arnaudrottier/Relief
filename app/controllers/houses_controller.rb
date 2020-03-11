class HousesController < ApplicationController
  def show
    if current_user.room.nil?
      current_user.room = Room.last
    end
    @room_chores = RoomChore.where(period: Period.current)
    @previous_room_chores = RoomChore.where(period: Period.current - 1)
    @current_room_chores = RoomChore.where(period: Period.current)
    @next_room_chores = RoomChore.where(period: Period.current + 1)
    @whiteboard_message = WhiteboardMessage.new
    @messages = WhiteboardMessage.last(10)
    @amenities = Amenity.all
    @current_room_chore = current_user.current_room_chore
    @previous_room_chore = current_user.previous_room_chore
    @next_room_chore = current_user.next_room_chore
    @booking = Booking.new
    @user = User.find_by(id: params[:id])
    @users = User.all
  end
end
