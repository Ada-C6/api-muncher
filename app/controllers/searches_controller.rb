class SearchesController < ApplicationController
  def new; end

  def index
    @search_term = params[:search_term].strip

    if @search_term.empty?
      flash[:error] = "No search terms entered. Please enter a new search."

      render :new and return
    end

    @response = EdamamApiWrapper.search(@search_term)

    if !@response.parsed_response.nil?
      @recipe_results = Recipe.search_results(@response).paginate(page: params[:page], per_page: 10)

      if @recipe_results.empty?
        flash[:no_results] = "No recipes for #{@search_term}."
      end

    else
      flash[:notice] = "Failed to send search for #{@search_term}: #{@response["error"]}"

      render :new and return
    end
  end

  def show
    @search = EdamamApiWrapper.search(params[:id])

    @recipe = Recipe.search_results(@search).first

    @ingredients = @recipe.ingredient_objects.map { |ingredient_object| ingredient_object["text"] }
  end
end
