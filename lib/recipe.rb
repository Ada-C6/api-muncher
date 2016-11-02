class Recipe
  attr_reader :label, :image, :source_url, :diet_labels, :health_labels, :cautions, :ingredients

  def initialize(label)#, image, options = {} )
    # raise ArgumentError if label == nil || label == "" #|| image == nil || image == ""

    @label = label
    # @image = image
    #
    # @source_url = options[:source_url]
    # @diet_labels = options[:diet_labels]
    # @health_labels = options[:healthLabels]
    # @cautions = options[:cautions]
    # @ingredients = options[:ing]
  end

  def self.all
    @@recipes ||= EdamamApiWrapper.listrecipes
  end

  def self.reset
    @@recipes = nil
  end

end
