class AddProviderMakeIdToMakers < ActiveRecord::Migration
  def change
    add_column :makers, :provider_make_id, :integer
  end
end
