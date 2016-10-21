namespace :webmotors do
  namespace :importer do
    
    desc "Import data from Webmotors and saved in the database"
    task :cars, [:option] => [:environment] do |task, args|
      
      @register = ::Provider.find_by(name: 'webmotors')
      raise 'Provider is not registered. Run rake db:seed to record provider Webmotors' unless @register
      @conf ||= PROVIDERS.select{|p| p['name'] == @register.name}.first
      @importer = Importers::Webmotors.new(@conf)
      
      case args.option
        when 'makers', 'marcas', 'brands' then @importer.makers
        when 'vehicles', 'modelos', 'models' then @importer.vehicles
        else raise ArgumentError.new "Invalid option passed for rake task"
      end

    end

  end
end