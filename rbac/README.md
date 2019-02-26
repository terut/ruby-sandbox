## Experimental RBAC Implimentation

```sh
$ docker-compose up
$ docker-compose exec mysql mysqladmin -u root create rbac_example
$ bundle install --path vendor/bundle --clean
$ bundle exec ridgepole -c database.yaml --apply
$ ruby seed.rb

# You can edit as you like before running.
$ ruby rbac.rb
```

### LICENSE

MIT
