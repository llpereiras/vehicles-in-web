class MakerProvider < ActiveRecord::Base
  validates_uniqueness_of :provider_id, :scope => :maker_id, :message => 'Is already a record joining Maker and Provider'

  belongs_to :provider
  belongs_to :maker
end