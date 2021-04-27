class MoviesController < ApplicationController
  def index
    @movies = Movie.where(genre: ["basic", "git", "ruby", "rails"])
  end

  def show
    @movies = Movie.where(content: ["basic", "git", "ruby", "rails"])
  end
end
