class CreateMakersProviders < ActiveRecord::Migration
  def change
    create_table :makers_providers do |t|
      t.references :maker, index: true, foreign_key: true
      t.references :provider, index: true, foreign_key: true
      t.integer :provider_make_id

      t.timestamps null: false
    end
  end
end
