class Permission < ActiveRecord::Base
  has_many :roles_permissions
  has_many :roles, through: :roles_permissions
end
