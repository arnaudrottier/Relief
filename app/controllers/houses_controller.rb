class HousesController < ApplicationController
  def show
    @room_chores = RoomChore.where(room.user == current_user)
  end
end
