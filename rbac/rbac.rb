require_relative 'initializer'

# Note: This is really primitive implementation.
# Manager
user = User.find_by_username("peach")
permitter = Permitter.new(user.role.permissions.pluck(:name))

pp permitter.permit?("roles.update")
pp permitter.permit?("roles.delete")
