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
          prototype = Adapters::Maker.webmotors(maker)
          next if prototype[:name].empty?
          register = ::Maker.find_by(name: prototype[:name])
          if register
            register.update(prototype)
          else
            register = ::Maker.create(prototype)
          end
          raise "Maker can not be saved. #{prototype}" unless register

          # relationship with provider
          ::MakerProvider.find_or_create_by(maker_id: register.id, provider_id: @provider.id, provider_make_id: maker['Id'])
        end

        puts "#{json.size} cars makers saved"
      end

      def vehicles
        puts "Saving cars models..."
        uri = URI("#{@url}#{@resources['cars']['models']}")

        ::Maker.eager_load(:providers).by_webmotors.each do |maker|
          response = HttpClient.post(url: uri, form: {marca: maker.providers.first.try(:provider_make_id)})
          json = JSON.parse response.body

          if json.empty? or json.nil?
            puts "#{maker.name} - No cars models found on the site."
            next
          end

          json.each do |vehicle|
            prototype = Adapters::Vehicle.webmotors(vehicle, maker: maker, category: ::Vehicle.categories['car'] )
            next if prototype[:name].empty?
            next if ::Vehicle.find_by(name: prototype[:name])
            vehicle = ::Vehicle.create(prototype)
            raise "Vehicle can not be saved. #{prototype}" unless vehicle
          end

          puts "#{maker.name} - #{json.size} cars models saved"
        end
      end
    end
  end
end
