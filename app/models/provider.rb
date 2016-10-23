class Provider < ActiveRecord::Base
  validates_presence_of :name
  
  has_many :makers, class_name: 'MakerProvider'
end
