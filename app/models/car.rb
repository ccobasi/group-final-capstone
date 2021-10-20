class Car < ApplicationRecord
    include ImageUploader::Attachment(:image)
 validates :name, presence: true

 has_one :reservation, :class_name => 'Reservation', :foreign_key => 'car_id'
end
