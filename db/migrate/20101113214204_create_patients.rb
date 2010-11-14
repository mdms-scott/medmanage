class CreatePatients < ActiveRecord::Migration
  def self.up
    create_table :patients do |t|
      t.string :first_name
      t.string :last_name
      t.string :middle_name
      t.datetime :dob
      t.string :sex
      t.integer :ssn
      t.string :insurance
      t.string :attending
      t.string :primary
      

      t.timestamps
    end
  end

  def self.down
    drop_table :patients
  end
end
