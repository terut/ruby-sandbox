Bundler.require(:default)

Algolia.init(application_id: ENV["APP_ID"],
             api_key:        ENV["ADMIN_API_KEY"])

index = Algolia::Index.new('posts')
index.set_settings(
  attributesForFaceting: [
    'filterOnly(organization)',
    'filterOnly(viewable_by)'
  ]
)

batch = JSON.parse(File.read('posts.json'))
index.add_objects(batch)
