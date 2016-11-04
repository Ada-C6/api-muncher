require 'test_helper'

class RecipesControllerTest < ActionController::TestCase

  test "should get index" do
    get :index, {startindex: 0}
    assert_response :success
    assert_template :index
  end

  test "should get show" do
    VCR.use_cassette("recipes") do
      get :show, {id: 'recipe_637913ec61d9da69eb451818c3293df2'}
      assert_response :success
      assert_template :show
    end
  end
end
