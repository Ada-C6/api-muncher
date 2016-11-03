class Recipe
  attr_reader :name, :url, :image, :id, :ingredients, :diet_labels, :health_labels

  def initialize(name, url, image, id, ingredients, diet_labels, health_labels)
    @name = name
    @url = url
    @image = image
    @id = id
    @ingredients = ingredients
    @diet_labels = diet_labels
    @health_labels = health_labels


    # if q = nil || q = ""
    #   raise ArgumentError
    # end

  end


end
