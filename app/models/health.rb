class Health < ApplicationRecord
    has_many :medications

    validates :diagnosis, presence: true
    validates :diagnosis, uniqueness: true
end
