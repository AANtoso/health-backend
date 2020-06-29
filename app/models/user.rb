class User < ApplicationRecord
    has_secure_password
    has_many :healths

    validates :username, :email, presence: true, uniqueness: true
end
