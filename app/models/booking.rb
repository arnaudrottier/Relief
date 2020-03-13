class Booking < ApplicationRecord
  belongs_to :room
  belongs_to :amenity
  validates :start_date, presence: true
  validates :end_date, presence: true
  default_scope { order(start_date: :desc) }
  scope :booking_from_today, -> { where("end_date >= ?", Date.today).order(start_date: :desc) }

  def formatted_start_date
    start_date.strftime("%b %d")
  end

  def formatted_end_date
    start_date.strftime("%b") == end_date.strftime("%b") ? end_date.strftime("%d") : end_date.strftime("%b %d")
  end

  def formatted_start_time
    start_date.strftime("%l:%M %p")
  end

  def formatted_end_time
    end_date.strftime(" %l:%M %p")
  end

end

