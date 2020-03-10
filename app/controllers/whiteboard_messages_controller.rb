class WhiteboardMessagesController < ApplicationController

  def create
    @messages = WhiteboardMessage.all
    @whiteboard_message = WhiteboardMessage.new(whiteboard_messages_params)
    if @whiteboard_message.save
      redirect_to my_house_path
    else
      render "houses/show"
    end
  end

  private

  def whiteboard_messages_params
    params.require(:whiteboard_message).permit(:message, :image)
  end

end
