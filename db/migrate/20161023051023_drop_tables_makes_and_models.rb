class DropTablesMakesAndModels < ActiveRecord::Migration
  def change
    drop_table :makes
    drop_table :models
  end
end
