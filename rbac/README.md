## Experimental RBAC Implimentation

```sh
$ docker-compose up
$ bundle install --path vendor/bundle --clean
$ bundle exec ridgepole -c database.yaml --apply
$ ruby seed.rb

# You can edit as you like before running.
$ ruby rbac.rb
```

### LICENSE

MIT
