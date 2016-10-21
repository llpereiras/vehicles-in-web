class Maker < ActiveRecord::Base
  validates_presence_of :name
  
  belongs_to :provider
end
