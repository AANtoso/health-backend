class MedicationSerializer
    include FastJsonapi::ObjectSerializer
    attributes :id, :name, :dose, :frequency
    belongs_to :health
end.