class Recipe
  attr_reader :label, :image, :rec_source, :url

  def initialize(label, image, rec_source, url)
    if label ==  nil || label == ""
      raise ArgumentError
    end

    @label = label
    @image = image
    @source = rec_source
    @url = url
  end

end
