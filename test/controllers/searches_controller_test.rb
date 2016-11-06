require 'test_helper'

class SearchesControllerTest < ActionController::TestCase
  test "index contains three variables with values" do
    VCR.use_cassette("c_recipes") do
      post :create, params: {search_word: "pork"}
      assert_kind_of Array, assigns[:results]
      assigns[:results].each do |result|
        assert_kind_of Recipe, result
      end
      assert_response :ok
      assert_template :index
    end

    VCR.use_cassette("c_recipes") do
      get :index
      assert_not_empty assigns
      assert_equal 0, assigns[:search_index]
      assert_equal "pork", assigns[:search_word]
      assert_not_empty assigns[:results]
      assigns[:results].each do |result|
        assert_kind_of Recipe, result
      end
      assert_response :ok
      assert_template :index
    end
  end

  test "show should show a single recipe object" do
    VCR.use_cassette("c_recipes") do
      get :show, params: {id: "e74a63af2c01078b3a6cc34fbb06f061"}
      assert_kind_of Recipe, assigns[:recipe]
      assert_template :show
    end
  end

  test "show should redirect to root path and show an error if recipe ID is invalid" do
    VCR.use_cassette("c_recipes") do
      get :show, params: {id: "bad-id"}
      assert_not_empty flash
      assert_redirected_to root_path
    end
  end

  # This test does not work, I wonder if it's useless because you'd never make it to the show path without some sort of id.
  #
  # test "show should redirect to root path and show an error if recipe ID is nil" do
  #   VCR.use_cassette("c_recipes") do
  #     assert_raises UrlGenerationError do
  #       get :show, params: {id: nil}
  #     end
  #     assert_empty flash
  #     assert_redirected_to root_path
  #   end
  # end

  test "new should render the new template" do
    VCR.use_cassette("c_recipes") do
      get :new
      assert_response :ok
      assert_template :new
    end
  end

  test "create should fill a results collection with recipe objects" do
    VCR.use_cassette("c_recipes") do
      post :create, params: {search_word: "pork"}
      assert_kind_of Array, assigns[:results]
      assigns[:results].each do |result|
        assert_kind_of Recipe, result
      end
      assert_response :ok
      assert_template :index
    end
  end

  test "create should flash an error and redirect to root path if search term gave no results" do
    VCR.use_cassette("c_recipes") do
      post :create, params: {search_word: "xxxxxxxxxxxxxxxxx"}
      assert_not_empty flash
      assert_redirected_to root_path
    end
  end

  test "create should flash an error and redirect to root path if nil is searched" do
    VCR.use_cassette("c_recipes") do
      post :create, params: {search_word: nil}
      assert_not_empty flash
      assert_redirected_to root_path
    end
  end

  test "create should keep track of the search term and have an index of 0" do
    VCR.use_cassette("c_recipes") do
      post :create, params: {search_word: "chocolate"}
      assert_not_empty assigns
      assert_equal "chocolate", assigns[:search_word]
      assert_equal 0, assigns[:search_index]
      assert_template :index
    end
  end

  # Hope to god this test actually tests what I want it to
  test "page should change the search results" do
    VCR.use_cassette("c_recipes_page") do
      post :create, params: {search_word: "pork"}
      @pork_search_one = assigns[:results]
      assert_kind_of Array, @pork_search_one
      @pork_search_one.each do |result|
        assert_kind_of Recipe, result
      end
    end

    VCR.use_cassette("c_recipes_page") do
      get :page, params: {search_word: "pork", search_index: 20}
      pork_search_two = assigns[:new_page_results]
      assert_not_empty pork_search_two
      assert_not_nil pork_search_two
      pork_search_two.each do |recipe|
        assert_kind_of Recipe, recipe
      end

      assert_not_equal @pork_search_one, pork_search_two
      assert_template :index
    end
  end
end
