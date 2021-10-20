class Car < ApplicationRecord

 validates :name, presence: true

#  has_one :reservation, :class_name => 'Reservation', :foreign_key => 'car_id'
end
