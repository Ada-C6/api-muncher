class Recipe
  attr_reader :name, :uri

  def initialize(name, uri)
    @name = name
    @uri = uri


    # if q = nil || q = ""
    #   raise ArgumentError
    # end

  end


end
