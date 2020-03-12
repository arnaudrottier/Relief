class Amenity < ApplicationRecord
  has_many :bookings
  validates :name, presence: true
#   validates :availability, presence: true

  def next_booking
    bookings.order(start_date: :asc).first
  end


end
