class Recipe
  attr_reader :label, :link, :ingrediants, :dietary, :photo

  def initialize(label, options = {})
    raise ArgumentError if label == nil || label == ""
    @label = label
    @photo = options[:photo]
    @link = options[:link]
  end

  def self.search(string)
    EdamamApiWrapper.search_recipes(string)
  end

  def self.by_label(label)
    matches = EdamamApiWrapper.search_recipes(label)
    return matches.first
  end

end
