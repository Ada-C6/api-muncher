class SearchesController < ApplicationController
  def new
    # @search = EdamamApiWrapper.search(term)
  end

  def create
    result = EdamamApiWrapper.search(params[:search_term])
    if result["ok"]
      flash[:notice] = "Successfully sent search for #{params[:search_term]}"
    else
      flash[:notice] = "Failed to send search for #{params[:search_term]}: #{result["error"]}"
    end
    redirect_to new_search_path
  end
end
