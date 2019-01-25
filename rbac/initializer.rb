require 'bundler'
Bundler.require

Dir[File.expand_path('./models') << '/*.rb'].each do |file|
  require_relative file
end

db = YAML.load_file('database.yaml')
ActiveRecord::Base.establish_connection(db)
