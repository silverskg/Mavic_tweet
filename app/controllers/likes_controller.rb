class LikesController < ApplicationController

  def create
    current_user.likes.create!(tweet_id: params[:tweet_id])
    redirect_back(fallback_location: root_path)
  end

  def destroy
    current_user.likes.find_by(tweet_id: parmas[:tweet_id]).destroy!
    redirect_back(fallback_location: root_path)
  end
end