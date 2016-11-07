require 'test_helper'

class HomepagesControllerTest < ActionController::TestCase
# my index just has my search form - just testing that this page exists.  Not sure that I need to use the VCR in this case, because I'm not making a call to API?
  test "should get index" do
    VCR.use_cassette('get-index') do
       get :index
      assert_response :success
    end
  end

  test "should get show page for selected item in search results" do
    VCR.use_cassette("show_recipe") do
      recipe = EdamamApiWrapper.show_recipe("http://www.edamam.com/ontologies/edamam.owl%23recipe_4a97965157df17841696bbbcc8a27935")
      get :show, {uri: recipe.uri}
      assert_response :success
    end
  end

# not sure if this is actually testing what I am wanting it to test...I struggled to just test for first results page...when :from starts out as nil.  In this test, :from is starting as nil, and then :from becomes 10 and :to is 20. Is this actually testing the first results page then?
  test "Should get results page with first 10 search items when given a search term" do
    VCR.use_cassette("search_term") do
      get :results, {search_term: "cupcake"}
      assert_response :success
      assert_equal @controller.params[:from], 10
      assert_equal @controller.params[:to], 20
    end
  end

  test "More results should give 10 more recipes" do
    VCR.use_cassette("next_cupcake_page") do
      get :results, {search_term: "cupcake", from: 10}
      assert_response :success
      assert_equal @controller.params[:from], 20
      assert_equal @controller.params[:to], 30
    end
  end


end
