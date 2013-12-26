class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    #authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @users = User.all
    @tweets = Tweet.all
  end

  def show
    @user = User.find(params[:id])
    @tweets = Tweet.all
  end
  
  def update
    authorize! :update, @user, :message => 'Not authorized as an administrator.'
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user], :as => :admin)
      redirect_to users_path, :notice => "User updated."
    else
      redirect_to users_path, :alert => "Unable to update user."
    end
  end
    
  def destroy
    authorize! :destroy, @user, :message => 'Not authorized as an administrator.'
    user = User.find(params[:id])
    unless user == current_user
      user.destroy
      redirect_to users_path, :notice => "User deleted."
    else
      redirect_to users_path, :notice => "Can't delete yourself."
    end
  end

  def follow
  @user = User.find(params[:id])

  if current_user
    if current_user == @user
      flash[:error] = "You cannot follow yourself."
    else
      current_user.follow(@user)
      #RecommenderMailer.new_follower(@user).deliver if @user.notify_new_follower
      flash[:notice] = "You are now following #{@user.name}."
    end
  else
    flash[:error] = "You must <a href='/users/sign_in'>login</a> to follow #{@user.name}.".html_safe
  end
  redirect_to users_path
end

def unfollow
  @user = User.find(params[:id])

  if current_user
    current_user.stop_following(@user)
    flash[:notice] = "You are no longer following #{@user.name}."
  else
    flash[:error] = "You must <a href='/users/sign_in'>login</a> to unfollow #{@user.name}.".html_safe
  end
  redirect_to users_path
end




end