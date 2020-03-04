class RoomChoresController < ApplicationController

  def show
    @room_chore = RoomChore.find(params[:id])
  end

  def edit
    @room_chore = RoomChore.find(params[:id])

  end

  def update
    @room_chore = RoomChore.find(params[:id])
    if @room_chore.update(room_chore_params)
      redirect_to room_chore_path
    else
      render 'edit'
    end
  end

  private
  def room_chore_params
    params.require(:room_chore).permit(:status, :notes, :period)
  end

end
