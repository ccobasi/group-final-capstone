class Reservation < ApplicationRecord
  validates :date, presence: true
  validates :user_id, presence: true
  validates :car_id, presence: true

  belongs_to :user
  belongs_to :car
  belongs_to :city
end
