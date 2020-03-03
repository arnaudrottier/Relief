class User < ApplicationRecord
  belongs_to :room, required: false
# Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # validates :first_name, presence: :true
  # validates :last_name, presence: :true


end
