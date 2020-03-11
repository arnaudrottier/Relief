class ChoresController < ApplicationController
  def index
    @room_chores = RoomChore.where(period: Period.current).order(created_at: :asc)
    @rooms = @room_chores.map { |room_chore| room_chore.room }.sort_by { |room| room.number }
    @users = User.all.joins(:room).order('rooms.number ASC')

    @previous_room_chores = RoomChore.where(period: Period.last)
    @current_room_chores = RoomChore.where(period: Period.current)
    @next_room_chores = RoomChore.where(period: Period.next)
  end

end
