class SearchesController < ApplicationController
  def new
    # @search = EdamamApiWrapper.search(term)
  end

  def create
    # @todo - refactor this input check to somewhere else -- maybe edamam_api_wrapper?
    @search_term = params[:search_term].strip

    if @search_term.empty?
      flash[:error] = "No search terms entered. Please enter a new search."

      render :new and return
    end

    @result = EdamamApiWrapper.search(@search_term)

    if @result["ok"]
      flash[:notice] = "Successfully sent search for #{@search_term}."
    else
      flash[:notice] = "Failed to send search for #{@search_term}: #{@result["error"]}"
    end

    redirect_to recipes_path
  end

  # @todo in recipes controller - handle no-responses case (try searching "3453.4")
end
