class User < ApplicationRecord
  has_merit

  belongs_to :room, required: false
  has_many :room_chores, through: :room
# Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # validates :first_name, presence: :true
  # validates :last_name, presence: :true
  has_one_attached :image


  def current_room_chore
    self.room_chores.find_by(period: get_period)
  end

  def previous_room_chore
    self.room_chores.find_by(period: get_period - 1)
  end

  def next_room_chore
    self.room_chores.find_by(period: get_period + 1)
  end

  def get_period
    (Date.today.year.to_s + Date.today.cweek.to_s).to_i
  end

end
