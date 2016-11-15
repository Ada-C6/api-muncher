require 'test_helper'
require 'copy_writer'

class CopyWriterTest < ActionController::TestCase

  test "get description for a valid set of ingredients (stripped-down data)" do
    description = CopyWriter.get_description([{"food" => "cherries"}, {"food" => "whipped cream"}, {"food" => "chocolate sauce"}], "Martha Stewart")
    assert description.include? "cherries, whipped cream, and chocolate sauce. From Martha Stewart."
  end

  test "get description for a valid set of ingredients (typical data)" do
    description = CopyWriter.get_description([
      {
        "text" => "1/3 cup chopped fresh tarragon",
        "quantity" => 0.33333334,
        "measure" => "cup",
        "food" => "fresh tarragon",
        "weight" => 25.2352
      },
      {
        "text" => "1/4 cup dijon mustard",
        "quantity" => 0.25,
        "measure" => "cup",
        "food" => "dijon mustard",
        "weight" => 62.25
      },
      {
        "text" => "1/4 cup dry white wine",
        "quantity" => 0.25,
        "measure" => "cup",
        "food" => "dry white wine",
        "weight" => 56.5
      },
      {
        "text" => "1 tablespoon olive oil",
        "quantity" => 1,
        "measure" => "tbsp",
        "food" => "olive oil",
        "weight" => 13.5
      }], "Martha Stewart")
    assert description.include? "fresh tarragon, dijon mustard, dry white wine, and olive oil. From Martha Stewart."
  end

  test "get description for a single ingredient (full data)" do
    description = CopyWriter.get_description([
      {"text" => "1 tablespoon olive oil",
        "quantity" => 1,
        "measure" => "tbsp",
        "food" => "olive oil",
        "weight" => 13.5
      }], "Martha Stewart")
    assert description.include? "olive oil. From Martha Stewart."
  end

  test "a lack of ingredient array elements results in an error" do
    assert_raises ArgumentError do
      description = CopyWriter.get_description([], "Martha Stewart")
    end
  end

  test "a lack of source name results in an error" do
    assert_raises ArgumentError do
      description = CopyWriter.get_description([
        {"text" => "1 tablespoon olive oil",
          "quantity" => 1,
          "measure" => "tbsp",
          "food" => "olive oil",
          "weight" => 13.5
        }], nil)
    end
  end

end
