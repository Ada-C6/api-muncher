class PagesController < ApplicationController

  def index
    @data = Recipe.all
  end

end
