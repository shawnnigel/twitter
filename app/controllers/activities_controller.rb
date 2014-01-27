class ActivitiesController < ApplicationController
  
def index
	 @tweets = Tweet.all.page(params[:page]).per(5)
    @users = User.all

  @allactivities = PublicActivity::Activity.order("created_at desc")
  @activities=Kaminari.paginate_array(@allactivities).page(params[:page]).per(8)
end

end
