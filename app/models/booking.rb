class Booking < ApplicationRecord
  belongs_to :room
  belongs_to :amenity
  validates :start_date, presence: true
  validates :end_date, presence: true
end

