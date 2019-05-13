Bundler.require(:default)

require 'yaml'

username = ARGV[0].to_sym
keyword = ARGV[1]

users = YAML.load_file("users.yaml")

client = Elasticsearch::Client.new url: ENV["URL"], http: { user: ENV["USERNAME"], password: ENV["PASSWORD"] }
res = client.search index: "posts", body: {
  query: {
    bool: {
      must: {
        match: {
          post: keyword
        }
      },
      filter: {
        bool: {
          must: [
            {
              terms: {
                organization: [users[username][:organization]]
              }
            },
            {
              terms: {
                viewable_by: users[username][:groups] + [0]
              }
            }
          ]
        }
      }
    }
  }
}
puts res.to_json
