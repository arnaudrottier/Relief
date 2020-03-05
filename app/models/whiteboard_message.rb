class WhiteboardMessage < ApplicationRecord
  validates :message, presence: true
  has_one_attached :image
end
