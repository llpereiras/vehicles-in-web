module Importers
  class Webmotors
    
    def initialize(config)
      @config = config
      @url = @config['url']
      @resources = @config['resources']
      @provider = Provider.find_by(name: 'webmotors')
    end
    
    def makers
      uri = URI("#{@url}#{@resources['cars']['brands']}")
      response = Net::HTTP.post_form(uri, {})
      json = JSON.parse response.body

      raise "No makers found on the site." if json.empty? or json.nil?

      json.each do |maker|
        prototype = Adapters::Maker.webmotors(maker)
        prototype[:provider] = @provider
        next if prototype[:name].empty?
        next if Maker.find_by(name: prototype[:name])
        Maker.create(prototype)
      end
       
      puts "#{json.size} car makers saved"
    end

    def vehicles
      url = File.join(@url, @resources['cars']['models'])
      debugger
    end
    
  end
end