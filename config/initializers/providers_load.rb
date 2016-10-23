template = ERB.new File.new("#{Rails.root.to_s}/config/providers.config.yml").read
PROVIDERS = YAML.load(template.result)['providers']
