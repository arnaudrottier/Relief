class HousesController < ApplicationController
  def show
    raise
    @room_chores = current_user.room.room_chores
    @whiteboard_message = WhiteboardMessage.new
    @messages = WhiteboardMessage.all
  end
end
