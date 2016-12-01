require 'test_helper'
require 'awesome_print'
require 'faker'

class EdamamApiWrapperTest < ActionController::TestCase
  # Just to verify that Rake can pick up the test
  test 'the truth' do
    assert true
  end

  test "Can retreive a list of recipes" do
    VCR.use_cassette("lots_of_recipes") do
      recipes = EdamamApiWrapper.list_recipes("banana")
      assert recipes.is_a? Array
      assert recipes.length > 0
      assert_not_empty(recipes)

      recipes.each do | ch |
        assert ch.is_a? Recipe
      end
    end
  end

  test "No search results returns an empty array" do
    VCR.use_cassette("no_recipes_returned") do
      recipes = EdamamApiWrapper.list_recipes("lemon dogfish pudding")
      assert recipes.is_a? Array
      assert recipes.length == 0
    end
  end

  test "Can get a single recipe with the uri" do
    VCR.use_cassette("one_recipe") do
      recipe = EdamamApiWrapper.get_recipe("http://www.edamam.com/ontologies/edamam.owl%23recipe_d78d4e56031360082ec9c63167eef0db")
      assert recipe.is_a? Recipe
    end
  end

  test "Single recipe attributes are correct" do
    VCR.use_cassette("one_recipe") do
      recipe = EdamamApiWrapper.get_recipe("http://www.edamam.com/ontologies/edamam.owl%23recipe_d78d4e56031360082ec9c63167eef0db")
      assert_equal recipe.name, "Baked pasta with four cheeses"
      assert_equal recipe.id, "http://www.edamam.com/ontologies/edamam.owl%23recipe_d78d4e56031360082ec9c63167eef0db"
      assert_equal recipe.url, "http://lacucinaitalianamagazine.com/recipe/pasticcio_di_pasta_ai_quattro_formaggi"
      assert_equal recipe.health_labels, [
        "Vegetarian",
        "Egg-Free",
        "Peanut-Free",
        "Tree-Nut-Free",
        "Soy-Free",
        "Fish-Free",
        "Shellfish-Free"]
      assert_equal recipe.diet_labels, [
        "Balanced"]
      assert_equal recipe.cautions, []
      assert_equal recipe.instructions, ["2 cups whole milk", "3 tablespoons unsalted butter", "3 tablespoons unbleached all-purpose flour", "¼ teaspoon salt", "Freshly grated nutmeg", "2½ ounces fontina cheese, cubed (about ½ cup)", "2½ ounces asiago cheese, cubed (about ½ cup)", "3 ounces gorgonzola cheese, crumbled (about ½ cup)", "1 pound short pasta, like penne", "1⅓ cups freshly grated parmigiano-reggiano or grana padano cheese"]
      assert recipe.ingredients.length == 10
      assert recipe.ingredients.is_a?(Array)
      assert_equal recipe.image, "https://www.edamam.com/web-img/1c5/1c5588b3c75873e738c9a55cb9b436b2.jpg"
      assert_equal recipe.edamam_url, "http://www.edamam.com/recipe/baked-pasta-with-four-cheeses-d78d4e56031360082ec9c63167eef0db/-"
      assert_equal recipe.servings, 6
      assert_equal recipe.calories, 3834
      assert_equal recipe.source, "La Cucina Italiana"
      assert recipe.nutrition_info
      assert recipe.nutrition_info.is_a?(Array)
    end
  end

  test "Returns edamam's count of recepes that meet the search criteria" do
    VCR.use_cassette("total_lots_of_recipes") do
      total = EdamamApiWrapper.total_recipes("banana")
      VCR.use_cassette("lots_of_recipes") do
        recipes = EdamamApiWrapper.list_recipes("banana")
        assert_not_equal(total, nil)
        assert_equal(total, recipes[0].count)
        assert total.is_a?(Integer)
      end
    end
  end

  test "Returns 0 for total count if no recepes meet the search criteria" do
    VCR.use_cassette("total_no_recipes") do
      total = EdamamApiWrapper.total_recipes("lemon dogfish pudding")
      assert_equal total, 0
      assert_not_equal total, nil
      assert total.is_a?(Integer)
    end
  end
end
