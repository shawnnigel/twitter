class ActivitiesController < ApplicationController
  
def index
	 @tweets = Tweet.all
    @users = User.all
  @activities = PublicActivity::Activity.order("created_at desc")
end

end
