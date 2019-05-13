## Elasticsearch Example

Elasticesearch service account is required.

### Setup

```sh
# Setup your host, username and password.
$ cp env.example .env
$ vim .env

# Create index.
# See post.json if you want to know index
$ env $(cat .env) bundle exec ruby create.rb

# Create users. See users.yaml
$ env $(cat .env) bundle exec ruby create_users.rb

# Search
# Usage: ruby search.rb [username] [keyword]
$ env $(cat .env) bundle exec ruby search.rb mario "行動" | jq .

# Test
$ env $(cat .env) bundle exec ruby test_search.rb mario
```
