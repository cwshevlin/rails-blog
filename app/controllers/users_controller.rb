class UsersController < ActionController::Base
  include ApplicationHelper

  def new
    @user = User.new
  end

  def create
    user = User.create(username: params[:username], password: params[:password])
    redirect_to user_path(user.id)
  end

  def login
  end

end
