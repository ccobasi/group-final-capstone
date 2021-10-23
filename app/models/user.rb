class User < ApplicationRecord
    validates :username, presence: true, length: { minimum: 6, maximum: 12 }, uniqueness: true
    validates_presence_of :email
    validates_uniqueness_of :email

    has_many :reservations, dependent: :destroy
    has_secure_password
end
