require 'test_helper'

class EdamamAPIWrapperTest < ActiveSupport::TestCase

  test "whether the tests are running" do
    assert true
  end

  test "Can receive information from Edamam API" do
    VCR.use_cassette("recipes") do
      search_term = "Chicken"
      page = 1
      recipes = EdamamApiWrapper.recipe_search(search_term, page)

      name = "Grilled Deviled Chickens Under a Brick"

      api_hash = {:recipe_image=>"https://www.edamam.com/web-img/5f5/5f51c89f832d50da84e3c05bef3f66f9.jpg", :source_url=>"http://www.marthastewart.com/recipe/grilled-deviled-chickens-under-a-brick", :ingredients=>["4 baby chickens (poussins) or cornish hens (about 1 1/4 pounds each), or 4 chicken breast halves", "3 lemons, plus wedges for garnish", "4 cloves garlic, peeled and smashed", "1 tablespoon crushed red-pepper flakes, or to taste", "1 tablespoon finely chopped fresh thyme", "1 tablespoon finely chopped fresh rosemary", "1/2 cup olive oil", "Salt, to taste"], :calories=>5922, :dietary_info=>["Fat 451.213026g", "Saturated 112.94890599999998g", "Trans 2.041164g", "Monounsaturated 220.50419400000004g", "Polyunsaturated 85.26193800000001g", "Carbs 24.77649g", "Carbs (net) 17.43919g", "Fiber 7.3373g", "Sugars 5.19302g", "Protein 425.421g", "Cholesterol 1700.97mg", "Sodium 1620.77852707296mg", "Calcium 342.3029280006644mg", "Magnesium 484.5155970000277mg", "Potassium 4718.1431760002215mg", "Iron 23.251887010009142mg", "Zinc 30.148825700002767mg", "Phosphorus 3400.4162mg", "Vitamin A 1050.1606µg", "Vitamin C 144.22356000000002mg", "Thiamin (B1) 1.475606mg", "Riboflavin (B2) 2.833012mg", "Niacin (B3) 155.00653mg", "Vitamin B6 8.37388mg", "Folic Acid (B9) 164.89860000000004µg", "Vitamin B12 7.030676000000001µg", "Vitamin D 4.53592µg", "Vitamin E 24.163970000000003mg", "Vitamin K 103.49530000000001µg"], :yield=>4, :source=>"Martha Stewart", :source_icon=>nil}

      assert true, recipes[200]

      assert_equal name, recipes.first.name
      assert_equal api_hash[:recipe_image], recipes.first.recipe_image
      assert_equal api_hash[:source_url], recipes.first.source_url
      assert_equal api_hash[:ingredients], recipes.first.ingredients
      assert_equal api_hash[:calories], recipes.first.calories
      assert_equal api_hash[:dietary_info], recipes.first.dietary_info
      assert_equal api_hash[:yield], recipes.first.yield
      assert_equal api_hash[:source], recipes.first.source
      assert_equal api_hash[:source_icon], recipes.first.source_icon
    end
  end

  test "search_recipe will return an array of Recipes" do
    VCR.use_cassette("recipes") do
      search_term = "Chicken"
      page = 1
      recipes = EdamamApiWrapper.recipe_search(search_term, page)
      assert_not recipes.empty?
      assert_kind_of Array, recipes
      recipes.each do |recipe|
        unless recipes.last
          assert_kind_of Recipe, recipe
        end
      end
    end
  end
end
