class RoomChore < ApplicationRecord
  belongs_to :room
  belongs_to :chore
end
