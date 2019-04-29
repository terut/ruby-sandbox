Bundler.require(:default)

require 'yaml'

users = YAML.load_file("users.yaml")
username = ARGV[0].to_sym
keyword = ARGV[1]

Algolia.init(application_id: ENV["APP_ID"],
             api_key: users[username][:secured_api_key])

index = Algolia::Index.new("posts")
puts index.search(keyword).to_json
