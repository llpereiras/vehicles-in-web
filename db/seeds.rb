# encoding: UTF-8

# Save providers (loaded in config/application.rb)
PROVIDERS.each do |p|
  Provider.find_or_create_by(name: p['name'])
end
puts "#{PROVIDERS.size} providers saved"

# default makers
makers = %w(Chevrolet Citroën Fiat Ford Honda Hyundai Kia Mitsubishi Nissan Peugeot Renault Toyota Volkswagen)
makers.each do |name|
  Maker.find_or_create_by name: name
end
puts "#{makers.size} car makers saved"
