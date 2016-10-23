class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :name
      t.references :maker, index: true, foreign_key: true
      t.integer :type

      t.timestamps null: false
    end
  end
end
