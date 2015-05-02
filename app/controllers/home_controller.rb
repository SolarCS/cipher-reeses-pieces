class HomeController < ApplicationController
  include ApplicationHelper

  def index
    @user = current_user
    @results = []
  end

  def search
    @results = MovieServices.search(params[:keyword])
    #binding.pry
  end

  def add_to_watchlist
    movie = Movie.build_from_itunes_response(params[:movie])
    if current_user.movies.find_by_name(movie.name) == nil
      current_user.movies << movie
    else
      flash[:alert] = "Movie is already on the watchlist"
      respond_to do |format|
        format.js { render :file => "home/show_alert.js.erb" }
      end
    end
    @watchlist = current_user.movies
  end
end
