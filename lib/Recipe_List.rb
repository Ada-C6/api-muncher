class RecipeList
  attr_reader :search_term

  def initialize(search_term, web_address)
    @search_term = search_term
    @web_address = web_address 
  end

end
