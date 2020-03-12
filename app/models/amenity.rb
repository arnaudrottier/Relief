class Amenity < ApplicationRecord
  has_many :bookings
  validates :name, presence: true
#   validates :availability, presence: true

  def next_booking
    bookings.order(start_date: :asc).first
  end

  def next_booking_formatted
    next_booking.strftime("%b %e %l: %M")
  end

end
