class Booking < ApplicationRecord
  belongs_to :room
  belongs_to :amenity
  validates :start_time, presence: true
  validates :end_time, presence: true
end

