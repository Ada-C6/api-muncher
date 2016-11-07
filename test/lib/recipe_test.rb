require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
    test "whether the tests are running" do
        assert true
    end

    #
    # INSTANCE METHODS
    #

    test "Recipe can be created with name, image, url, ingredients, dietary info and uri" do
        name = "test name"
        image = "https://www.edamam.com/web-img/108/108bb897a2fd724bc1461d77031a560f.jpg"
        url = "test_url.com"
        ingredients = ["tomatoes", "onions"]
        dietary_info = ["Vegan", "Gluten-Free"]
        uri = "http://www.edamam.com/ontologies/edamam.owl#recipe_93fb018a7857caab86cdbe45aa4f462f"
        unique_portion_uri = "93fb018a7857caab86cdbe45aa4f462f"
        r = Recipe.new(name, image, url, ingredients, dietary_info, uri)
        assert_kind_of Recipe, r
        assert_equal r.name, name
        assert_equal r.image, image
        assert_equal r.url, url
        assert_equal r.ingredients, ingredients
        assert_equal r.dietary_info, dietary_info
        assert_equal r.uri, unique_portion_uri
    end

    test "ArgumentError will be raised and Recipe object will not be created if it's missing one or more parameters from the API call" do
        name = "test name"
        image = "https://www.edamam.com/web-img/108/108bb897a2fd724bc1461d77031a560f.jpg"
        url = "test_url.com"
        ingredients = ["tomatoes", "onions"]
        dietary_info = ["Vegan", "Gluten-Free"]
        uri = "http://www.edamam.com/ontologies/edamam.owl#recipe_93fb018a7857caab86cdbe45aa4f462f"

        assert_raises ArgumentError do
            missing_name = Recipe.new(image, url, ingredients, dietary_info, uri)
            return missing_name
        end

        assert_raises ArgumentError do
            missing_image_and_ingredients = Recipe.new(name, url, dietary_info, uri)
            return missing_image_and_ingredients
        end
    end
end
