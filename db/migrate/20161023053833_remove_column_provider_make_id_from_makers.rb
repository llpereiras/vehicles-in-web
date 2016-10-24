class RemoveColumnProviderMakeIdFromMakers < ActiveRecord::Migration
  def change
    remove_column :makers, :provider_make_id
  end
end
