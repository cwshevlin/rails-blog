class UsersController < ApplicationController
  include ApplicationHelper

  def index
    @users = User.all
  end

  def show
    @posts = Post.where(author_id: current_user.id)
  end

  def edit
    @user = current_user
  end

  def new
    if session[:user_id]
      redirect_to root_path
    end
    @user = User.new
  end

  def create
    user = User.create(username: params[:user][:username], password: params[:user][:password])
    session[:user_id] = user.id
    redirect_to root_path
  end


  def post_login
    user = User.find_by(username: params[:user][:username])
    p user
    puts "^^^^^^^^^^^^"
    if user && user.authenticate(params[:user][:username], params[:user][:password])
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      redirect_to root_path
    end
  end

  def logout
    session.clear
    redirect_to root_path
  end

end
