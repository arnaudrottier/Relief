class Chore < ApplicationRecord
  has_many :room_chores
  validates :name, presence: true
  validates :description, presence: true
  validates :frequency, presence: true
end
