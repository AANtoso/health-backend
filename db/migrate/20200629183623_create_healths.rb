class CreateHealths < ActiveRecord::Migration[6.0]
  def change
    create_table :healths do |t|
      t.string :diagnosis
      t.string :medications
      t.string :notes

      t.timestamps
    end
  end
end
