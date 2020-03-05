class WhiteboardMessagesController < ApplicationController

  def create
    @message = WhiteboardMessage.new(whiteboard_messages_params)
    if @message.save
      redirect_to my_house_path
    else
      render 'houses/show'
    end
  end

  private

  def whiteboard_messages_params
    params.require(:whiteboard_message).permit(:message, :image)
  end

end
