class HomeController < ApplicationController
  include ApplicationHelper

  def index
    @user = current_user
    @results = []
  end

  def search
    @results = MovieServices.search(params[:keyword])
  end

  def add_to_watchlist
    movie = Movie.build_from_itunes_response(params[:movie])
    if current_user.has_movie?(movie)
      @message = "The movie is already on the watchlist..."
      @type = "warning"
      respond_to do |format|
        format.js { render :file => "home/show_alert.js.erb" }
      end
    else
      current_user.add_movie movie
      @watchlist = current_user.movies
      @message = "You have a new movie on your watchlist!"
      @type = "success"
      respond_to do |format|
        format.js { render :file => "home/show_alert.js.erb" }
      end
    end
  end
end
