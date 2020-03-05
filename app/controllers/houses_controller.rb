class HousesController < ApplicationController
  def show
<<<<<<< HEAD
    @room_chores = RoomChore.where(room.user == current_user)
=======
    @whiteboard_message = WhiteboardMessage.new
    @messages = WhiteboardMessage.all
>>>>>>> ba8f5f70a76762495e4148a24a9e3ed2f1fb3e1f
  end
end
