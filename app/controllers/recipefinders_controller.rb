class RecipefindersController < ApplicationController
  def index
    @homepage = true
  end

  def show
    @recipes, @count = Edamam_Api_Wrapper.search(params[:query], params[:from])

    if @recipes == false
      redirect_to recipefinders_index_path
      flash[:notice] = "Sorry, that request could not be fulfilled. Please try again."
    else
      @results_begin = params[:from].to_i + 1
      @results_end = @results_begin + @recipes.length - 1
      @search_term = params[:query]
    end
  end
end
