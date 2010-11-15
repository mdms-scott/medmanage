class CreateMedications < ActiveRecord::Migration
  def self.up
    create_table :medications do |t|
      t.integer :patient_id
      t.integer :drug_id
      t.string :prescribing
      t.integer :prescription
      t.integer :dose
      t.integer :quantity
      t.datetime :filled_on
      t.integer :refills

      t.timestamps
    end
  end

  def self.down
    drop_table :medications
  end
end
