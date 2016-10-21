module Importers
  class Webmotors
    
    def initialize(config)
      @config = config
      @url = @config['url']
      @resources = @config['resources']
    end
    
    def makers
      url = File.join(@url, @resources['cars']['brands'])
      debugger
    end

    def vehicles
      url = File.join(@url, @resources['cars']['models'])
      debugger
    end
    
  end
end