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
    @users = current_user.writers
  end

  def add_writer
    if params.has_key? :user_id
      @user = User.find(params[:user_id])
      unless current_user.writers.include? @user
        current_user.writers << @user
      end
    end
    respond_to do |format|
      format.js
    end
  end

  def delete_writer
    if params.has_key? :user_id
      @user = User.find(params[:user_id])
      if current_user.writers.include? @user
        current_user.writers -= [@user]
      end
    end
    respond_to do |format|
      format.js
    end
  end

  def edit
  end

  def update
    @user = User.find(current_user.id)
    @user.update(user_params)
    redirect_to root_path
  end

  def add_post
    @post = Post.new
    @post.body = params[:post][:body]
    @post.save
    current_user.posts << @post
    respond_to do |format|
      format.js
    end
  end

  def delete_post
    @post = Post.find(params[:post_id])
    @post.destroy
    respond_to do |format|
      format.js
    end
  end

  private
    def user_params
      params.require(:user).permit(:name, :surname, :nic, :city, :email, :avatar)
    end
end
