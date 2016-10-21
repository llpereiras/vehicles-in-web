module Adapters
  class Maker
    
    def self.webmotors(item)
      {
        name: item['Nome'].titleize,
        provider: nil,
        provider_make_id: item['Id']
      }
    end
    
  end
end
