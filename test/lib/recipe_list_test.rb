require 'test_helper'
require 'recipe_list'

class RecipeListTest < ActionController::TestCase

  test "the truth" do
    assert true
  end

  test "can create a new recipe" do
    recipe = RecipeList.new("Amazing Cupcakes", 'https://www.edamam.com/web-img/9d6/9d6dde186b5b082461f5c6038c51604b.jpg', 'http://www.101cookbooks.com/archives/000132.html', 'http://www.edamam.com/ontologies/edamam.owl%23recipe_4a97965157df17841696bbbcc8a27935')
    assert(recipe.is_a?(RecipeList))
  end

  test "Must have a label, image, uri, and url for a new recipe" do
    assert_raises ArgumentError do
      RecipeList.new nil, nil, nil, nil
    end
    assert_raises ArgumentError do
      RecipeList.new "", "", "", ""
    end
    assert_raises ArgumentError do
      RecipeList.new "slack-api-test", "", "", ""
    end
    assert_raises ArgumentError do
      RecipeList.new "slack-api-test", nil, nil, nil
    end
  end

  test "label attribute is set correctly" do
    recipe = RecipeList.new("label", "uri",  "url",  "image")
    assert_not_nil(recipe.label)
    assert_equal(recipe.label, "label")
  end

  test 'uri attribute is set correctly' do
    recipe = RecipeList.new("label", "image", "http://www.edamam.com/ontologies/edamam.owl%23recipe_4a97965157df17841696bbbcc8a27935", "url")
    assert_not_nil(recipe.uri)
    assert_equal(recipe.uri, "http://www.edamam.com/ontologies/edamam.owl%23recipe_4a97965157df17841696bbbcc8a27935")
  end

  test 'url attribute is set correctly' do
    recipe = RecipeList.new("label", "image", "uri", "http://www.101cookbooks.com/archives/000132.html")
    assert_not_nil(recipe.url)
    assert_equal(recipe.url, "http://www.101cookbooks.com/archives/000132.html")
  end

  test 'new recipe has an image' do
    recipe = RecipeList.new("label", "https://www.edamam.com/web-img/9d6/9d6dde186b5b082461f5c6038c51604b.jpg", "url",  'uri')
    assert_not_nil(recipe.image)
    assert_equal(recipe.image, "https://www.edamam.com/web-img/9d6/9d6dde186b5b082461f5c6038c51604b.jpg")
  end

end
