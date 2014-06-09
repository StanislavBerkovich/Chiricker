class PersonsController < ApplicationController
  before_filter :authenticate_user!
  def profile
    @user = (params.has_key?(:user_id) ? User.find(params[:user_id]) : current_user)
    @post = Post.new
  end

  def feed
    @posts = Post.all
  end

  def read_writers
    @users = User.all
  end

  def add_post
    @post = Post.new
    @post.body = params[:post][:body]
    @post.save
    current_user.posts << @post
    redirect_to root_path
  end
end
