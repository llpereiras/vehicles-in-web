module Adapters
  class Maker
    
    def self.webmotors(item)
      Hash.new(
        name: item['Nome'].titleize,
        provider: nil,
        provider_source_id: item['Id']
      )
    end
    
  end
end
