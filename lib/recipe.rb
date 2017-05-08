class Recipe
  attr_reader :label, :uri, :url, :image_url, :ingredients, :dietary_info, :tags, :summary

  def initialize(label, uri, options = {})
    raise ArgumentError if label == nil || label == "" || uri == nil || uri == ""

    @label = label
    @uri = uri.split(/[_]/).last
    @url = options[:url]
    @image_url = options[:image_url]
    @ingredients = options[:ingredients]
    @tags = options[:tags]
    if options[:dietary_info]
      i = options[:dietary_info]
      dietary_info = [i["ENERC_KCAL"], i["FAT"], i["CHOCODF"], i["FIBTG"], i["SUGAR"], i["PROCNT"], i["CHOLE"], i["NA"]]
      @dietary_info = dietary_info.compact
    end
  end

  class << self
    attr_reader :results, :count # this hasn't been set anywhere yet, but will be when we memoize it below?
  end

  def self.search(search_term, page)
    from = (page.to_i - 1) * 10
    results_array = EdamamApiWrapper.search(search_term, from)
    @results = results_array[0]
    @count = results_array[1]
  end

  def self.find(id)
    unless self.results.nil?
      recipe = self.results.find do |result|
        result.uri == id
      end
      return recipe unless recipe.nil?
    end
    return EdamamApiWrapper.recipe(id)
  end
end
