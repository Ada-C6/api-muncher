require 'test_helper'

class SearchResultTest < ActiveSupport::TestCase
  test "whether the tests are running" do
    assert true
  end

  test "SearchResult can be created with a label, image, url, diet labels, health labels and ingredients" do
    id = "38923"
    label = "Pad Thai"
    image = "https://www.edamam.com/web-img/739/739879ed85ba6bd08bb882bdee50ef5c.jpg"
    url = "http://www.marthastewart.com/recipe/chez-pim-pad-thai"
    diet_labels = ["High-Fiber"]
    health_labels = ["Dairy-Free", "Gluten-Free", "Egg-Free", "Tree-Nut-Free"]
    ingredients = ["1/2 cup tamarind juice", "1/2 cup thai palm sugar", "1/2 cup thai fish sauce", "1 tablespoon ground chili powder", "Vegetable oil, for cooking", "30 large shrimp, peeled and deveined", "1 (6.7-ounce) package sponge fried tofu, divided into 6 equal portions, each portion thinly sliced", "1 (16-ounce) bag dried rice stick noodles", "3 cloves garlic, chopped", "1/4 cup plus 2 tablespoons prepared pickled turnips, chopped", "6 cups bean sprouts", "3 cups fresh flat-leaf garlic chives or scallions, dark-green parts only, cut into 2-inch pieces", "1 cup chopped roasted unsalted peanuts, for serving", "Lime wedges, for serving"]

    sr = SearchResult.new(id, label, image, url, diet_labels, health_labels, ingredients)
    assert_equal sr.id, id
    assert_equal sr.label, label
    assert_equal sr.image, image
    assert_equal sr.url, url
    assert_equal sr.diet_labels, diet_labels
    assert_equal sr.health_labels, health_labels
    assert_equal sr.ingredients, ingredients
  end

  test "SearchResult.all returns an array of SearchResult objects" do
    VCR.use_cassette("search_results") do
      results = SearchResult.all("asparagus")
      assert_kind_of Array, results
      assert_not results.empty?
      results.each do |result|
        assert_kind_of SearchResult, result
      end
    end
  end

  test "calling SearchResult.all with an id as a query returns a SearchResult object with a matching id" do
    VCR.use_cassette("search_results") do
      id = "79f0ef5b6faac78268cf02043412f50d"
      result = SearchResult.all(id)
      assert_kind_of Array, result
      assert_not result.empty?
      result.each do |result|
        assert_equal result.id, id
      end
    end
  end

end
