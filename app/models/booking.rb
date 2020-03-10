class Booking < ApplicationRecord
  belongs_to :room
  belongs_to :amenity
  validates :start_date, presence: true
  validates :end_date, presence: true

  def formatted_start_date
    start_date.strftime("%b %e, %l:%M %p")
  end

  def formatted_end_date
    end_date.strftime("%b %e, %l:%M %p")
  end

end

