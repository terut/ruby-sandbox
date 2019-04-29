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

search_api_key = ENV["SEARCH_API_KEY"]
# Unit is min
api_key_expires_in = 60 * 30

secured_api_keys = users.each_with_object({}) do |(name, user), api_keys|
                     organization_filter = "organization:#{user.organization}"
                     viewable_by_filter = (["viewable_by:all"] + user.groups.map{|g| "viewable_by:#{g}"}).join(" OR ")

                     secured_api_key = Algolia.generate_secured_api_key(
                       search_api_key,
                       {
                         filters: organization_filter + " AND " + viewable_by_filter,
                         validUntil: Time.now.to_i + api_key_expires_in
                       }
                     )

                     api_keys[name] = {
                       organization: user.organization,
                       groups: user.groups,
                       secured_api_key: secured_api_key
                     }
                   end

YAML.dump(secured_api_keys, File.open("users.yaml", "w"))
