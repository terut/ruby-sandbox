class Permitter
  attr_reader :permissions

  def initialize(permissions = [])
    @permissions = Set.new(permissions)
  end

  def permit?(permission)
    permissions.include?(permission)
  end
end
