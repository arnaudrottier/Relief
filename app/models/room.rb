class Room < ApplicationRecord
  has_many :users
  has_many :room_chores
  has_many :chores, through: :room_chores
  validates :number, presence: true
end
