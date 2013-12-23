class HomeController < ApplicationController
  def index
    @users = User.all
    @tweets = Tweet.all
   
  end
end
