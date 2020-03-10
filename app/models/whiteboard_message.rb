class WhiteboardMessage < ApplicationRecord
  validates :message, presence: true
  has_one_attached :image
  belongs_to :user
end
