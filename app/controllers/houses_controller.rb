class HousesController < ApplicationController
  def show
    if current_user.room.nil?
      current_user.room = Room.last
    end

    @room_chores = current_user.room.room_chores
    @whiteboard_message = WhiteboardMessage.new
    @messages = WhiteboardMessage.all
  end
end
