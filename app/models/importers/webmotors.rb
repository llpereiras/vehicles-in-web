module Importers
  class Webmotors
    
    def initialize(config)
      @config = config
      @url = @config['url']
      @resources = @config['resources']
      @provider = Provider.find_by(name: 'webmotors')
    end
    
    def makers
      uri = File.join(@url, @resources['cars']['brands'])

      PhantomClient.new_session
      PhantomClient.visit(uri, sleep: 3)
      
      # click button brands
      PhantomClient.click('/html/body/div[2]/div[4]/div[4]/div[3]/div/div/div/button[1]', sleep: 3)

      doc = Nokogiri::HTML(PhantomClient.html)
      elements = doc.search('li.stage>ul>li>a>span.dis-tc.valign-m.wid100prc.lh-1_2em')
      brands = elements.map{|b| b.text.titleize}.uniq!
      
      raise "No marks found on the site. Check the importer!" if brands.empty? or brands.nil?
      
      brands.each do |b|
        Maker.create(name: b, provider: @provider ) unless Maker.find_by(name: b)
      end

      puts "#{brands.size} car makers saved"
    end

    def vehicles
      url = File.join(@url, @resources['cars']['models'])
      debugger
    end
    
  end
end