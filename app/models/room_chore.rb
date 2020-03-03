class RoomChore < ApplicationRecord
  belongs_to :room
  belongs_to :chore
  validates :period, presence: true
end
