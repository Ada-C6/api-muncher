class SearchesController < ApplicationController
  def new; end

  def index
    # @todo - refactor this input check to somewhere else -- maybe edamam_api_wrapper?
    @search_term = params[:search_term].strip

    if @search_term.empty?
      flash[:error] = "No search terms entered. Please enter a new search."

      render :new and return
    end

    @response = EdamamApiWrapper.search(@search_term)

    if !@response.parsed_response.nil?

      # flash[:notice] = "Successfully sent search for #{@search_term}."
      @recipe_results = Recipe.search_results(@response).paginate(page: params[:page], per_page: 10)

      if @recipe_results.empty?
        flash[:no_results] = "No recipes for #{@search_term}."
      end

    else
      flash[:notice] = "Failed to send search for #{@search_term}: #{@response["error"]}"

      render :new and return
    end

    # render :index
    # redirect_to recipes_path
  end

  def show
    @search = EdamamApiWrapper.search(params[:id])

    @recipe = Recipe.search_results(@search).first

    @ingredients = @recipe.ingredient_objects.map { |ingredient_object| ingredient_object["text"] }
  end

  def create
    # # @todo - refactor this input check to somewhere else -- maybe edamam_api_wrapper?
    # @search_term = params[:search_term].strip
    #
    # if @search_term.empty?
    #   flash[:error] = "No search terms entered. Please enter a new search."
    #
    #   render :new and return
    # end
    #
    # @result = EdamamApiWrapper.search(@search_term)
    #
    # if @result["ok"]
    #   flash[:notice] = "Successfully sent search for #{@search_term}."
    # else
    #   flash[:notice] = "Failed to send search for #{@search_term}: #{@result["error"]}"
    # end
    # redirect_to recipes_path
  end

  # @todo in recipes controller - handle no-responses case (try searching "3453.4")
end
