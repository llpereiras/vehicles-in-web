class CreateMakers < ActiveRecord::Migration
  def change
    create_table :makers do |t|
      t.string :name
      t.references :provider, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
