class TweetsController < ApplicationController
  before_action :set_tweet, only: [:edit, :show]
  before_action :movie_to_index , except: [:index, :show]

  def index
    @tweets = Tweet.includes(:user).order("created_at DESC")
  end

  def new
    @tweet = Tweet.new
  end

  def create
    # binding.pry
    Tweet.create(tweet_params)
  end

  def show
    # binding.pry
    # @tweet = Tweet.find(params[:id])
  end

  def edit
    # @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params)
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
  end

  private
  def tweet_params
    params.require(:tweet).permit(:image, :text).merge(user_id: current_user.id)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def movie_to_index
    redirect_to action: :index unless user_signed_in?
  end
end
