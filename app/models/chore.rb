class Chore < ApplicationRecord
  has_many :room_chores, dependent: :destroy
  validates :name, presence: true
  validates :description, presence: true
  validates :frequency, presence: true
end
