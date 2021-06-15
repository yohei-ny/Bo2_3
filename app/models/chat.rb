class Chat < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_many :user_rooms, through: :rooms
end
