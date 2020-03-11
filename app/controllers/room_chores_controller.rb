class RoomChoresController < ApplicationController

  def show
    @room_chore = RoomChore.find(params[:id])
  end

  def edit
    @room_chore = RoomChore.find(params[:id])

  end

  def update
    @room_chore = RoomChore.find(params[:id])
    previous_status = @room_chore.status?
    if @room_chore.update(room_chore_params)
      if previous_status == false && @room_chore.status?
        current_user.add_points(10, category: 'room_chore_activity')
      elsif previous_status == true && @room_chore.status? == false
        current_user.subtract_points(10, category: 'room_chore_activity')
      end
      redirect_to chores_path
    else
      render 'edit'
    end
  end

  private
  def room_chore_params
    params.require(:room_chore).permit(:status, :notes, :period)
  end

end
