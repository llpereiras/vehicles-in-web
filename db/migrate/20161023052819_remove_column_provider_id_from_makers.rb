class RemoveColumnProviderIdFromMakers < ActiveRecord::Migration
  def change
    remove_column :makers, :provider_id
  end
end
