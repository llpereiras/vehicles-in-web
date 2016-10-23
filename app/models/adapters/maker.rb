module Adapters
  class Maker
    
    def self.webmotors(item, provider: nil)
      {
        name: item['Nome'].titleize,
        provider: provider,
        provider_make_id: item['Id']
      }
    end
    
  end
end
