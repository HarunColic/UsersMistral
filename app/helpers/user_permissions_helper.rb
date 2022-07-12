module UserPermissionsHelper
  def add_permission(user)
    "http://localhost:3000/user_permissions/new?user=#{user.id}"
  end
end
