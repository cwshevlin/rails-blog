class UsersController < ActionController::Base
  include ApplicationHelper

  def new
    @user = User.new
  end

  def create
    user = User.create(username: params[:user][:username], password: params[:user][:password])
    session[:user_id] = user.id
    puts user.id
    redirect_to user_path(user.id)
  end

  def login

  end

  def post_login
    user = User.find_by(username: params[:username])

    if user && user.authenticate
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      redirect_to root_path
    end
  end

end
