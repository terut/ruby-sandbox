## Algolia Example

Algolia account is required.

### Setup

```sh
# Setup your app_id, admin_api_key and search_api_key.
$ cp env.example .env
$ vim .env

# Create index.
# See post.json if you want to know index
$ env $(cat .env) bundle exec ruby create.rb

# Create secured API key to enfoce organization and viewable_by query.
# See users.yaml written secured api key with sample user's attributes.
$ env $(cat .env) bundle exec ruby create_secured_api_key.rb

# Search
# Usage: ruby search.rb [username] [keyword]
$ env $(cat .env) bundle exec ruby search.rb mario "mobile app" | jq .

# Test
$ env $(cat .env) bundle exec ruby test_search.rb mario

# Show UI
# Open http://localhost:8080
$ env $(cat .env) ruby server/server.rb
```
