class HealthSerializer
    include FastJsonapi::ObjectSerializer
    attributes :diagnosis
    has_many :medications
end