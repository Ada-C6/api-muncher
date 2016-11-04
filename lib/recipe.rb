class Recipe
  attr_reader :url, :name, :photo, :uri, :ingredientLines

  def initialize(url, name, photo, uri, ingredientLines)
    @url = url
    @name = name
    @photo = photo
    @uri = uri
    @ingredientLines = ingredientLines

    if url == nil || name == nil || photo == nil || uri = nil || ingredientLines == nil || url == "" || name == "" || photo == "" || uri = "" || ingredientLines == ""

    end


  end

end
