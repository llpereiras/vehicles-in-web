class Vehicle < ActiveRecord::Base
  validates_presence_of :name, :maker, :type
  
  belongs_to :maker

  enum type: [:car, :motorcycle]

  scope :car, -> { where(type: Vehicle.types['car'])}
  scope :motorcycle, -> { where(type: Vehicle.types['motorcycle'])}

  scope :by_webmotors, -> do
    joins(:makers)
      .where(provider: Provider.find(name: 'webmotors' ) )
  end
  
end
