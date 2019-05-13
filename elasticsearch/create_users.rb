Bundler.require(:default)

require 'yaml'

class User
  attr_reader :organization, :groups

  def initialize(org, groups)
    @organization = org
    @groups = groups
  end
end

users = {
  mario: User.new(1, [1,2]),
  luige: User.new(1, [3]),
  pikachu: User.new(2, [4,5]),
  eevee: User.new(2, [6])
}

new_users = users.each_with_object({}) do |(name, user), new_users|
  new_users[name] = {
    organization: user.organization,
    groups: user.groups
  }
end

YAML.dump(new_users, File.open("users.yaml", "w"))
