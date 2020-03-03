class RoomChore < ApplicationRecord
  belongs_to :room
  belongs_to :chore
  validates :status
  validates :start_date, presence: true
  validates :end_date, presence: true
end
