class User < ApplicationRecord
    validates :username, presence: true, length: { minimum: 6, maximum: 12 }, uniqueness: true
    validates :email, uniqueness:true
    validates_format_of :email, with: /@/
    validates :password_digest, presence: true

    has_many :reservations, dependent: :destroy
    has_secure_password
end
