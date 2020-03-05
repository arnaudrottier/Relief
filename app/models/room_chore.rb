class RoomChore < ApplicationRecord
  belongs_to :room
  belongs_to :chore
  validates :status, presence: true

  def user
    room.user
  end
end

def completed?
  status == "completed"
end
