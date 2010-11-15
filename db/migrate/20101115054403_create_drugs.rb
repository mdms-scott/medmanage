class CreateDrugs < ActiveRecord::Migration
  def self.up
    create_table :drugs do |t|
      t.string :name
      t.string :kind
      t.string :code
      t.string :generic_for
      t.string :purpose
      t.text :interactions

      t.timestamps
    end
  end

  def self.down
    drop_table :drugs
  end
end
