require 'test_helper'
require 'faker'
require 'awesome_print'

class HomepagesControllerTest < ActionController::TestCase

  test "should get featured product page if theres no search parameter" do
    VCR.use_cassette("Featured_product_index") do
      get :index
      assert_response :success
    end
  end

  test "Should get index get the first 12 search results if there is a search parameter" do
    VCR.use_cassette("Banana_search_index") do
      get :index, {search_term: "banana"}
      assert_response :success
      assert_not @controller.params[:next]
      assert_equal @controller.params[:from], 0
      assert_equal @controller.params[:to], 12
    end
  end

  test "should get show page for item" do
    VCR.use_cassette("show_baked_pasta") do
      VCR.use_cassette("one_recipe") do
        recipe = EdamamApiWrapper.get_recipe("http://www.edamam.com/ontologies/edamam.owl%23recipe_d78d4e56031360082ec9c63167eef0db")
        get :show, {name: "item_name", id: recipe.id} #{id: tasks(:adas_task).id}
        assert_response :success
      end
    end
  end

  test "NEXT button gets the next set of recepes" do
    VCR.use_cassette("Banana_NEXT_search_index") do
      get :index, {search_term: "banana", next: 0}  # next is 0 because :next = params[:from] & that is 0 initially
      assert_response :success
      # ap @response
      # ap @controller.params  ## OMG!!!!!!!!!!!!!!!!!!
      assert_not @controller.params[:back]
      assert_equal @controller.params[:next], "0"
      assert_equal @controller.params[:from], 12
      assert_equal @controller.params[:to], 24
    end
  end

  test "BACK button gets the previous set of recepes" do
    VCR.use_cassette("Banana_BACK_search_index") do
      get :index, {search_term: "banana", from: 12, to: 24, back: 12}
      assert_response :success
      # ap @response
      # ap @controller.params  ## OMG!!!!!!!!!!!!!!!!!!
      assert_not @controller.params[:next]
      assert_equal @controller.params[:back], "12"
      assert_equal @controller.params[:from], 0
      assert_equal @controller.params[:to], 12
      # ap @controller.instance_variable_get(:@recipes)[0]
    end
  end

  test "weird problem correcting the total search results ...because they're usually wrong" do
    VCR.use_cassette("total_error_NEXT_search_index") do
      get :index, {search_term: "hamburger pasta basil", next: 0} #This search returns 12 recepes, but the API count is 14, and my trick of subtracting 1 for every 10 search results still leaves the total at 13...
      assert_response :success
      assert_not @controller.params[:back]
      assert_equal @controller.params[:next], "0"
      assert_equal @controller.params[:from], 12
      assert_equal @controller.params[:to], 24
      assert_not_equal @controller.instance_variable_get(:@total), 14 #14 is what the api says it is
      assert_equal @controller.instance_variable_get(:@total), 12 #12 is what the number of actual recipes returned (only knows this when the last set of recepes is delivered)

      # ap @controller.params ## OMG!!!!!!!!!!!!!!!!!!
      # ap @response
      # ap @response.status   # Exact status code!
      # ap @controller.instance_variables  # SO GOOD!!!!!!!!!
      # ap @controller.instance_variable_get(:@total)
      # ap @controller.methods # All the things
      # ap @response.methods # All the things
      # ap @request.methods # All the things
    end
  end

end
