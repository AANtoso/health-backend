class CreateMedications < ActiveRecord::Migration[6.0]
  def change
    create_table :medications do |t|
      t.integer :health_id
      t.string :name
      t.string :dose
      t.string :frequency

      t.timestamps
    end
  end
end
