class WhiteboardMessage < ApplicationRecord
  validates :message, presence: true
end
