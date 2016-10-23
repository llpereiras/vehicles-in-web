class Maker < ActiveRecord::Base
  validates_presence_of :name

  has_many :providers, class_name: 'MakerProvider'

  scope :by_webmotors, -> do
    joins(:providers)
    .where('makers_providers.provider_id = ?', Provider.find_by(name: 'webmotors'))
  end
end
