namespace :webmotors do
  namespace :importers do
    
    desc "Import data from Webmotors and saved in the database"
    task :car, [:option] => [:environment] do |task, args|
      
      @register = ::Provider.find_by(name: 'webmotors')
      raise "Provider is not registered.\nRun 'rake db:seed' to record provider Webmotors" unless @register
      @conf ||= PROVIDERS.select{|p| p['name'] == @register.name}.first
      @importer = Webmotors::Importers::Car.new(@conf)
      
      case args.option
        when 'makers' then @importer.makers
        when 'vehicles' then @importer.vehicles
        else raise ArgumentError.new "Invalid option passed for rake task./nUse 'makers' or 'vehicles'"
      end

    end

  end
end