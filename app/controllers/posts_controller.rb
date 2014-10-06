class PostsController < ApplicationController
  include ApplicationHelper

  def index
  	@posts = Post.all
  end

  def new
  	@post = Post.new
  end

  def create
  	post = Post.create(title: params[:post][:title], body: params[:post][:body])
  	current_user.posts << post
  	redirect_to posts_path
  end

  def edit
  	@post = Post.find_by_id(params[:id])
  end

  def show
  	@post = Post.find_by_id(params[:id]) 
  end

  def patch
  	Post.find_by_id(params[:id]) 
  	post.update(params[:post])
  	redirect_to posts_path
  end

  def delete
  	Post.find_by_id(params[:id])
  	post.destroy 
  	redirect_to posts_path
  end
 

end