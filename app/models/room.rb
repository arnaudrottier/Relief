class Room < ApplicationRecord
  has_one :user
  has_many :room_chores
  has_many :chores, through: :room_chores
  validates :number, presence: true
end
