class TweetsController < ApplicationController

  def index
    @tweets = Tweet.all.page(params[:page]).per(5).order("created_at DESC")
  end

  def create
      Tweet.create(contents: tweet_params[:text])
      redirect_to action: :index
  end

  private
  def tweet_params 
    params.permit(:text)
  end

end