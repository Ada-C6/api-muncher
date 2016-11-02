require 'test_helper'

class RecipeTest <ActiveSupport::TestCase
  test "whether the tests are running" do
    assert true
  end

  test "that Recipe objects are created with all relevant information in the recipe hash" do
    recipe_hash = {
    name: "pannito",
    photo: "www.photo.com/pannito"
    }
    pannito = Recipe.new(recipe_hash)
    assert_equal pannito.name, recipe_hash[:name]
  end

end
#
# test "Channel can be created with name and ID" do
#   name = "test channel name"
#   id = "test id"
#   c = Channel.new(name, id)
#   assert_equal c.name, name
#   assert_equal c.id, id
# end
