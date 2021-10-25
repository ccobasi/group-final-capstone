class Car < ApplicationRecord
  validates :name, presence: true
  has_one_attached :image
  has_many :reservation, dependent: :destroy
  has_one :car_type, dependent: :destroy
end
