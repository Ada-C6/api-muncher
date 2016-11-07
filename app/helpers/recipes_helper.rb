module RecipesHelper
  def parse(uri)
    uri.split("_").last
  end
end
