class HousesController < ApplicationController
  def show
<<<<<<< HEAD
    raise
=======
    if current_user.room.nil?
      current_user.room = Room.last
    end

>>>>>>> 331aa935fced95d11d64f2865fa097647b2f82fa
    @room_chores = current_user.room.room_chores
    @whiteboard_message = WhiteboardMessage.new
    @messages = WhiteboardMessage.all
  end
end
