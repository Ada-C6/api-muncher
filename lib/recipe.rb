class Recipe
  attr_reader :uri, :name, :photo, :r_source, :url, :link, :diet_labels, :health_labels, :ingredientLines



  def initialize(uri, name, photo, r_source, url, link, diet_labels, health_labels, ingredientLines)
    @uri = uri
    @name = name
    @photo = photo
    @r_source = r_source
    @url = url
    @link = link
    @diet_labels = diet_labels
    @health_labels = health_labels
    @ingredientLines = ingredientLines

    if uri == nil || uri == "" || name = nil || name == "" || photo == nil || photo == "" || r_source == nil || r_source == "" || url == nil || url == "" || link == nil || link == "" || diet_labels == nil || diet_labels == "" || health_labels == nil || health_labels == "" || ingredientLines == nil || ingredientLines == ""

    end


  end

end
