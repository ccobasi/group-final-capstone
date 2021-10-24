class Car < ApplicationRecord
  validates :name, presence: true
  has_one_attached :image
  has_one :reservation
end
