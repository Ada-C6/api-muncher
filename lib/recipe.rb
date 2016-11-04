
class Recipe
  attr_reader :label, :uri, :ingredients, :diet_labels, :health_labels, :image, :url, :calories, :servings, :nutrients, :daily

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
    @calories = options[:calories]
    @daily = options[:daily]

  end

  def self.search(keyword, startindex = 0) #gives possibility of looking at the next ten hits.
    startindex = startindex.to_i
    EdamamApiWrapper.searchrecipes(keyword, startindex, (startindex+10))
  end

  def self.find(id)
    EdamamApiWrapper.find(id)
  end

  def kcal_per_serving
    @calories["quantity"].to_i / @servings
  end

  def get_daily(label)
    @daily.each do |item|
      if item[1]["label"] == label
        return (item[1]["quantity"]/@servings).round(2)
      end
    end
    return nil
  end

  def diet_info
    return @health_labels + @diet_labels
  end

end
