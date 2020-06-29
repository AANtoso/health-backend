class Medication < ApplicationRecord
    belongs_to :health

    validates :name, presence: true
    validates :name, uniqueness: true
end
