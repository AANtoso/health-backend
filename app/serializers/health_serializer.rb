class HealthSerializer
    include FastJsonapi::ObjectSerializer
    attributes :diagnosis, :medications, :notes
    has_many :medications
end