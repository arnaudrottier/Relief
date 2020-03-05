class RoomChore < ApplicationRecord
  belongs_to :room
  belongs_to :chore

  def user
    room.user
  end
end
