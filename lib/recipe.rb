class Recipe
  attr_reader :label, :uri, :image, :source_name, :sourceUrl, :yield, :healthLabels, :ingredientLines

  def initialize(label, source_name, uri, options = {} )
    raise ArgumentError if label == nil || label == "" || uri == nil || uri == "" || source_name == nil || source_name == ""

    @label = label
    @source_name = source_name
    @uri = uri
    @image = options[:image]
    @sourceUrl = options[:sourceUrl]
    @yield = options[:yield]
    @healthLabels = options[:healthLabels]
    @ingredientLines = options[:ingredientLines]
  end

  def self.search (search_term)
    #change to ||= if time permits
    EdamamApiWrapper.listrecipes(search_term)
  end

  def self.by_uri (uri_section)
    uri_search = search(uri_section)
    return uri_search.first   #since we are searching off of the unique uri, there will always only be 1 item returned in the array, therefore we can pull out the first
  end

end
