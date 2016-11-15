require 'test_helper'
require 'recipe.rb'

class RecipeTest < ActionController::TestCase

  test 'Can make a new recipe object with minimal fields (name, uri, at least one ingredient, and a source)' do
    recipe = Recipe.new({'label' => "Sephardic Style Haroset",
      'uri' => "http://www.edamam.com/ontologies/edamam.owl#recipe_3ca136a3c1a6cab55da72b644a18ba7f",
      "ingredients" => [{
            "text" => "1 1/2 cups red wine (recommended: cabernet sauvignon or manischewitz)",
            "quantity" => 1.5,
            "measure" => "cup",
            "food" => "red wine",
            "weight" => 339
          }],
      "source" => "Serious Eats"})
    assert recipe != nil
    assert_equal recipe.name, "Sephardic Style Haroset"
    assert_equal recipe.uri, "_3ca136a3c1a6cab55da72b644a18ba7f"
    assert_equal recipe.source, "Serious Eats"
    assert_equal recipe.ingredients.first['food'], "red wine"
  end

  test 'Cannot make a new recipe object with a missing required field' do
    # No label (name)
    assert_raises ArgumentError do
      recipe = Recipe.new({'uri' => "http://www.edamam.com/ontologies/edamam.owl#recipe_3ca136a3c1a6cab55da72b644a18ba7f",
        "ingredients" => [{
              "text" => "1 1/2 cups red wine (recommended: cabernet sauvignon or manischewitz)",
              "quantity" => 1.5,
              "measure" => "cup",
              "food" => "red wine",
              "weight" => 339
            }],
        "source" => "Serious Eats"})
    end
    # No URI
    assert_raises ArgumentError do
      recipe = Recipe.new({'label' => "Sephardic Style Haroset",
        "ingredients" => [{
              "text" => "1 1/2 cups red wine (recommended: cabernet sauvignon or manischewitz)",
              "quantity" => 1.5,
              "measure" => "cup",
              "food" => "red wine",
              "weight" => 339
            }],
        "source" => "Serious Eats"})
    end
    # No ingredients
    assert_raises ArgumentError do
      recipe = Recipe.new({'label' => "Sephardic Style Haroset",
        'uri' => "http://www.edamam.com/ontologies/edamam.owl#recipe_3ca136a3c1a6cab55da72b644a18ba7f",
        "source" => "Serious Eats"})
    end
    # No source
    assert_raises ArgumentError do
      recipe = Recipe.new({'label' => "Sephardic Style Haroset",
        'uri' => "http://www.edamam.com/ontologies/edamam.owl#recipe_3ca136a3c1a6cab55da72b644a18ba7f",
        "ingredients" => [{
              "text" => "1 1/2 cups red wine (recommended: cabernet sauvignon or manischewitz)",
              "quantity" => 1.5,
              "measure" => "cup",
              "food" => "red wine",
              "weight" => 339
            }]})
    end
  end

  test 'Can make a new recipe object with standard fields' do
    VCR.use_cassette("getrecipe") do
      url = "https://api.edamam.com/search?r=http://www.edamam.com/ontologies/edamam.owl%23recipe_637913ec61d9da69eb451818c3293df2&app_id=#{ENV['EDAMAM_CLIENT_ID']}&app_key=#{ENV['EDAMAM_CLIENT_SECRET']}"
      response = HTTParty.get(url)

      recipe = Recipe.new(response.first)
      assert recipe != nil
      assert_equal recipe.name, "Dijon and Tarragon Grilled Chicken"
      assert_equal recipe.health_labels.last, "Shellfish-Free"
      assert_equal recipe.calories, 6684.6095399999995
    end
  end

end
