Bundler.require(:default)

require 'json'

client = Elasticsearch::Client.new url: ENV["URL"], http: { user: ENV["USERNAME"], password: ENV["PASSWORD"] }

posts = JSON.parse(File.read('posts.json'))

indexed_posts = posts.map do |p|
  { index: { _index: 'posts', _type: 'item', data: p } }
end

client.bulk(body: indexed_posts)
