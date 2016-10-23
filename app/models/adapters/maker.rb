module Adapters
  class Maker
    
    def self.webmotors(item)
      {
        name: item['Nome'].titleize,
      }
    end
    
  end
end
