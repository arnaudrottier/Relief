class Booking < ApplicationRecord
  belongs_to :room
  belongs_to :amenity
  validates :start_date, presence: true
  validates :end_date, presence: true

  def formatted_start_date
    start_date.strftime("%b %d")
  end

  def formatted_end_date
    end_date.strftime("%b %d")
  end

  def formatted_start_time
    start_date.strftime("%H:%M")
  end

  def formatted_end_time
    end_date.strftime("%H:%M")
  end


end

