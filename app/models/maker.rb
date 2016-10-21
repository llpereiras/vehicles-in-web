class Maker < ActiveRecord::Base
  validates_presence_of :name
  validates_uniqueness_of :provider_id, :scope => :provider_source_id, :message => 'There is already a registered maker with these parameters'
  
  belongs_to :provider
end
