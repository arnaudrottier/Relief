class Amenity < ApplicationRecord
  has_many :bookings
  validates :name, presence: true
  # validates :availability, presence: true
end
