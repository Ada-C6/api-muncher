require 'test_helper'
require 'recipe_result'

class RecipeResultTest < ActionController::TestCase
#make sure rake is picking up the test
	test "the truth" do
		assert true
	end

	test 'Must Provide a URI and a Label for a Recipe Result' do
	
	assert_raises ArgumentError do
		RecipeResult.new nil, nil
	end

   assert_raises ArgumentError do
     RecipeResult.new "", ""
   end

   assert_raises ArgumentError do
     RecipeResult.new "", "SomeLabel"
   end

   assert_raises ArgumentError do
     RecipeResult.new "SomeURI", ""
   end

   assert_raises ArgumentError do
     RecipeResult.new "SomeURI", nil
   end

   assert_raises ArgumentError do
     RecipeResult.new nil, "SomeLabel"
   end
 end

 test "Name Attribute is Set Correctly" do
   test_me = RecipeResult.new "SomeURI", "SomeLabel"
   assert test_me.label == "SomeLabel"
 end

 test "ID Attribute is Set Correctly" do
   test_me = RecipeResult.new "SomeURI", "SomeLabel"
   assert test_me.uri == "SomeURI"
 end

end