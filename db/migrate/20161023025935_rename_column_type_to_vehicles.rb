class RenameColumnTypeToVehicles < ActiveRecord::Migration
  def change
    rename_column :vehicles, :type, :category
  end
end
