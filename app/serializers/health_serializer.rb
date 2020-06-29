class HealthSerializer
    include FastJsonapi::ObjectSerializer
    attributes :diagnosis, :medications, :notes
end