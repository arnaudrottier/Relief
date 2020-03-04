class ChoresController < ApplicationController
  def index
    @room_chores = RoomChore.where(period: Period.current).order(created_at: :asc)
    @rooms = @room_chores.map { |room_chore| room_chore.room }.sort_by { |room| room.number }
  end

end
