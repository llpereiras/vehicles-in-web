module Adapters
  class Vehicle

    def self.webmotors(item, maker: nil, category: nil)
      {
        name: item['Nome'],
        maker: maker,
        category: category
      }
    end

  end
end
