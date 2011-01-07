module Admin::UsersHelper
  def roles(user)
    user.class_name
  end
end
