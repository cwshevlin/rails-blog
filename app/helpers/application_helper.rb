module ApplicationHelper

  def users_path
    "/users"
  end

  def new_user_path
    "/users/new"
  end

  def edit_user_path(id)
    "/users/#{id}/edit"
  end

  def user_path(id)
    "/users/#{id}"
  end

end
