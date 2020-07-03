class MedicationSerializer
    include FastJsonapi::ObjectSerializer
    attributes :health_id, :name, :dose, :frequency
    belongs_to :health
end.