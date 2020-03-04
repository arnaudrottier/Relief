class HousesController < ApplicationController
  def show
    @whiteboard_message = WhiteboardMessage.new
    @messages = WhiteboardMessage.all
  end
end
