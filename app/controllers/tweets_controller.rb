class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]
before_filter :authenticate_user!
  # GET /tweets
  # GET /tweets.json
  def index
    @tweets = Tweet.all
    @users = User.all

  end

  # GET /tweets/1
  # GET /tweets/1.json
  def show
    @tweet = Tweet.find(params[:id])
    @user=User.all
  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
    @user=User.all
  end

  # GET /tweets/1/edit
  def edit
  end

  # POST /tweets
  # POST /tweets.json
  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user=current_user
    respond_to do |format|
      if @tweet.save
        format.html { redirect_to @tweet, notice: 'Tweet was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tweet }
      else
        format.html { render action: 'new' }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tweets/1
  # PATCH/PUT /tweets/1.json
  def update
     if current_user.id==@tweet.user_id
       
     
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: 'Tweet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  elsif current_user.id!=@tweet.user_id
    

    
    redirect_to tweets_url, {notice: 'You Cannot update the tweet since you are not the author :p .'}
    end

  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    if current_user.id==@tweet.user_id
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url }
      format.json { head :no_content }
    end
    else

    
    redirect_to tweets_url, {notice: 'Tweet was not  Deleted.'}
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tweet_params
      params.require(:tweet).permit(:content, :user_id)

    end
end
