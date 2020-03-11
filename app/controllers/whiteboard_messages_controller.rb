class WhiteboardMessagesController < ApplicationController

  def create
    @messages = WhiteboardMessage.all
    @whiteboard_message = WhiteboardMessage.new(whiteboard_messages_params)
    @whiteboard_message.user = current_user
    if @whiteboard_message.save
      respond_to do |format|
        format.html { redirect_to my_house_path }
        format.js
      end
    else
      respond_to do |format|
        format.html { render "houses/show" }
        format.js
      end
    end
  end

  def destroy
    @whiteboard_message = WhiteboardMessage.find(params[:id])
    if @whiteboard_message.delete
      respond_to do |format|
        format.html { redirect_to my_house_path }
        format.js
      end
    end
  end

  private

  def whiteboard_messages_params
    params.require(:whiteboard_message).permit(:message, :image)
  end

end
