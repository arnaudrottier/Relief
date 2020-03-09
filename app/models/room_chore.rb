class RoomChore < ApplicationRecord
  belongs_to :room
  belongs_to :chore
  # validates :status, presence: true

  def user
    room.user
  end

  def formatted_start_date
    start_date.strftime("%b %d")
  end

  def formatted_end_date
    end_date.strftime("%b %d")
  end
end
