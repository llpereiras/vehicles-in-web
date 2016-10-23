module Webmotors
  module Importers
    class Car
      def initialize(config)
        @config = config
        @url = @config['url']
        @resources = @config['resources']
        @provider = Provider.find_by(name: 'webmotors')
      end

      def makers
        puts "Saving cars makers..."
        uri = URI("#{@url}#{@resources['cars']['brands']}")
        response = HttpClient.post(url: uri)
        json = JSON.parse response.body

        if json.empty? or json.nil?
          puts "No cars makers found on the site."
          return
        end

        json.each do |maker|
          prototype = Adapters::Maker.webmotors(maker, provider: @provider)
          next if prototype[:name].empty?
          register = Maker.find_by(name: prototype[:name])
          register = (register) ? register.update(prototype) : Maker.create(prototype)
          raise "Maker can not be saved. #{prototype}" unless register
        end

        puts "#{json.size} cars makers saved"
      end

      def vehicles
        puts "Saving cars models..."
        uri = URI("#{@url}#{@resources['cars']['models']}")

        ::Maker.by_webmotors.each do |maker|
          response = HttpClient.post(url: uri, form: {marca: maker.provider_make_id})
          json = JSON.parse response.body

          if json.empty? or json.nil?
            puts "#{maker.name} - No cars models found on the site."
            next
          end

          json.each do |vehicle|
            prototype = Adapters::Vehicle.webmotors(vehicle, maker: maker, category: ::Vehicle.categories['car'] )
            next if prototype[:name].empty?
            next if Vehicle.find_by(name: prototype[:name])
            vehicle = Vehicle.create(prototype)
            raise "Vehicle can not be saved. #{prototype}" unless vehicle
          end

          puts "#{maker.name} - #{json.size} cars models saved"
        end
      end
    end
  end
end
