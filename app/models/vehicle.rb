class Vehicle < ActiveRecord::Base
  validates_presence_of :name, :maker, :category
  
  belongs_to :maker

  enum category: [:car, :motorcycle]

  scope :car, -> { where(type: Vehicle.category['car'])}
  scope :motorcycle, -> { where(type: Vehicle.category['motorcycle'])}
  scope :by_maker, -> (maker_id) { where(maker_id: maker_id)}

end
