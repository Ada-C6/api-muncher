class MuncherHit
  attr_reader :label, :image, :uri

  def initialize(label, image, uri)
    if label == nil || image == nil || uri == nil || label == "" || image == "" || uri == ""

      raise ArgumentError
    end
    
    @label = label
    @image = image
    @uri = uri
  end


end
