class HomepagesController < ApplicationController
#Note to self, use foundation for pages: http://foundation.zurb.com/sites/docs/pagination.html

  def index
    #Tentatively thinking to use this for the homepage, where the search bar sits
    
  end

  def search_results
    #Tentatively thinking to use this for search results
    results = Edamam_Api_Wrapper.find_recipes(params[:search_term])
  end

  def show
    #Tentatively thinking to use this for each recipe show
  end
end
