class Maker < ActiveRecord::Base
  validates_presence_of :name
  
  belongs_to :provider

  scope :by_webmotors, -> { where(provider: Provider.find_by(name: 'webmotors')) }
end
