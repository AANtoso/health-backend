class Health < ApplicationRecord
    belongs_to :user

    validates :user, :diagnosis, :medications, :notes, presence: true
end
