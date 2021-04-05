class TextsController < ApplicationController
  def index
    @texts = Text.where(genre: ["basic", "git", "html&css", "ruby", "rails"])
  end
end
