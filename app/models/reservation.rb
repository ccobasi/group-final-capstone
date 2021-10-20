class Reservation < ApplicationRecord
  validates :car_id, presence: true
  validates :user_id, presence: true

  belongs_to :car
  belongs_to :user
end
