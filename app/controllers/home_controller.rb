class HomeController < ApplicationController

  def index
    Recipe.reset
  end

end
