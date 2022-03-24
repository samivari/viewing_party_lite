class MoviesController < ApplicationController

  def index
    @movies = MovieFacade.top_rated_movies
  end

end
