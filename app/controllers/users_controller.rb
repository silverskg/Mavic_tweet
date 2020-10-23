class UsersController < ApplicationController

  def index
  end
  def show
    # binding.pry
    user = User.find(params[:id])
    @nickname = user.nickname
    @tweets = user.tweets
  end
end
