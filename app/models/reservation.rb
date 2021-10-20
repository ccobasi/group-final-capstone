class Reservation < ApplicationRecord
  validates :car, :user presence: true

  belongs_to :car, :user
end