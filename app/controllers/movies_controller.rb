class MoviesController < ApplicationController
  def index
    @movies = Movie.where(genre: ["basic", "git", "ruby", "rails"])
  end

  def show
    @movie = Movie.find(params[:id])
  end
end
