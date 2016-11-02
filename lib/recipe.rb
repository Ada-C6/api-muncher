class Recipe
  attr_reader :label, :url, :image_url, :ingredients, :dietary_info

  def initialize(label, url, options = {})
    raise ArgumentError if label == nil || label == "" || url == nil || url == ""

    @label = label
    @url = url
    @image_url = options[:image_url]
    @ingredients = options[:ingredients].map do |i|
      i["text"]
    end
    @dietary_info = options[:dietary_info]
  end

  class << self
    attr_reader :results # this hasn't been set anywhere yet, but will be when we memoize it below?
  end

  def self.search(search_term)
    @results ||= EdamamApiWrapper.search(search_term)
  end

end
