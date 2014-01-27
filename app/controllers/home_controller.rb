class HomeController < ApplicationController
  def index
    @users = User.all
    @tweets = Tweet.all
   @activities = PublicActivity::Activity.order("created_at desc").page(params[:page]).per(5)
  end
end
