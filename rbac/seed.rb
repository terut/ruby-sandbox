require_relative 'initializer'

exit if User.exists?

users = {
  "mario": "admin",
  "peach": "manager",
  "luigi": "member"
}

users.each do |u, r|
  role = Role.create(name: r)
  User.create(username: u, role: role)
end

permissions = {
  "admin": ["roles.list", "roles.show", "roles.create", "roles.update", "roles.delete"],
  "manager": ["roles.list", "roles.show", "roles.create", "roles.update"],
  "member": ["roles.list", "roles.show"]
}

permissions.each do |r, ps|
  role = Role.find_by(name: r)
  ps.each do |p|
    permission = Permission.create(name: p)
    RolesPermission.create(role: role, permission: permission)
  end
end
