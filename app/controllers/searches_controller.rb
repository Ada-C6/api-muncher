class SearchesController < ApplicationController
  def index
    @results
  end

  def show
    raise
    selection = @results.select do |recipe|
      if recipe.name == params[:recipe_name]
      end
    end

    return selection[0]
  end

  def new; end


  def create
    @results ||= EdamamApiWrapper.listrecipes(params[:search_word])
    class << self
      attr_writer :results
    end
    render :index
  end

end
