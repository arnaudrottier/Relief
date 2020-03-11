class WhiteboardMessage < ApplicationRecord

  default_scope { order(created_at: :desc) }

  validates :message, presence: true
  has_one_attached :image
  belongs_to :user
end
