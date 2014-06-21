class PersonsController < ApplicationController
  before_filter :authenticate_user!

  def profile
    @user = (params.has_key?(:user_id) ? User.find(params[:user_id]) : current_user)
    @post = Post.new
  end

  def feed
    @posts = Array.new
    @writers = current_user.writers
    @posts << current_user.posts
    @writers.each do |writer|
      @posts << writer.posts
    end
    @posts.flatten!
    @posts.sort! { |x, y| x.updated_at <=> y.updated_at }
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
      format.js {}
    end
  end

  def retweet_post
    @retweet_post = Post.find(params[:post_id])
    @retweet_writer = User.find(@retweet_post.user.id)
    @post = Post.new
    @post.user_id = @retweet_post.user_id
    @post.body = @retweet_post.body
    @post.retweeted = true
    @post.save
    current_user.posts << @post
    respond_to do |format|
      format.js
    end
  end

  def search
    @users = User.search(params[:search]) - [current_user]
  end

  private
  def user_params
    params.require(:user).permit(:name, :surname, :nic, :city, :email, :avatar)
  end
end
