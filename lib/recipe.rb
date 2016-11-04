
class Recipe
  attr_reader :label, :uri, :ingredients, :diet_labels, :health_labels, :image, :url, :nutrients, :servings

  def initialize(label, options = {})
    raise ArgumentError if label == nil || label == ""

    @label = label

    @uri = options[:uri]
    @ingredients = options[:ingredients]
    @diet_labels = options[:diet_labels]
    @health_labels = options[:health_labels]
    @image = options[:image]
    @url = options[:url]
    @nutrients = options[:nutrients]
    @servings = options[:servings]


  end

  def self.search(keyword, startindex = 0) #gives possibility of looking at the next ten hits.
    startindex = startindex.to_i
    EdamamApiWrapper.searchrecipes(keyword, startindex, (startindex+10))
  end

  def self.find(id)
    EdamamApiWrapper.find(id)
  end

  def return_calories
    self.nutrients["ENERC_KCAL"]
  end

  def kcal_per_serving
    self.return_calories["quantity"].to_i / @servings
  end

  def all_other_nutrients
    return_array = []
    self.nutrients.each do |key, val|
      unless key == "ENERC_KCAL"
        return_array << val
      end
    end
    return return_array

  end



end
