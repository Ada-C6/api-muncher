require 'test_helper'
require 'muncher_hit'

class MuncherHit_Test < ActionController::TestCase

test 'You must provide a label, image and uri for a recipe' do
  assert_raises ArgumentError do
    MuncherHit.new nil, nil, nil
  end
  assert_raises ArgumentError do
    MuncherHit.new "", "", ""
  end
  assert_raises ArgumentError do
    MuncherHit.new "", 12345, 12345
  end
  assert_raises ArgumentError do
    MuncherHit.new "Tofu With Crab Sauce", nil, nil
  end
  assert_raises ArgumentError do
    MuncherHit.new "Tofu With Crab Sauce", "", ""
  end
  assert_raises ArgumentError do
    MuncherHit.new nil, "https://www.edamam.com/web-img/d87/d8780bf7c2f2cca4f495d66b830b8686.jpg", "http://www.edamam.com/ontologies/edamam.owl#recipe_77719b1deefdfc752d3dd7cc828f255f"
  end
  assert_raises ArgumentError do
    MuncherHit.new nil, "https://www.edamam.com/web-img/d87/d8780bf7c2f2cca4f495d66b830b8686.jpg", nil
  end
  assert_raises ArgumentError do
    MuncherHit.new "", "https://www.edamam.com/web-img/d87/d8780bf7c2f2cca4f495d66b830b8686.jpg", ""
  end
  assert_raises ArgumentError do
    MuncherHit.new "Tofu With Crab Sauce", nil, "http://www.edamam.com/ontologies/edamam.owl#recipe_77719b1deefdfc752d3dd7cc828f255f"
  end
  assert_raises ArgumentError do
    MuncherHit.new nil, nil, "http://www.edamam.com/ontologies/edamam.owl#recipe_77719b1deefdfc752d3dd7cc828f255f"
  end
  assert_raises ArgumentError do
    MuncherHit.new "", "", "http://www.edamam.com/ontologies/edamam.owl#recipe_77719b1deefdfc752d3dd7cc828f255f"
  end
  assert_raises ArgumentError do
    MuncherHit.new "Tofu With Crab Sauce", "https://www.edamam.com/web-img/d87/d8780bf7c2f2cca4f495d66b830b8686.jpg", nil
  end
end

test "Label Attribute is set correctly" do
  test_me = MuncherHit.new "Tofu With Crab Sauce","https://www.edamam.com/web-img/d87/d8780bf7c2f2cca4f495d66b830b8686.jpg", "http://www.edamam.com/ontologies/edamam.owl#recipe_77719b1deefdfc752d3dd7cc828f255f"
  assert test_me.label == "Tofu With Crab Sauce"
end

test "URI Attribute is set correctly" do
  test_me = MuncherHit.new "Tofu With Crab Sauce","https://www.edamam.com/web-img/d87/d8780bf7c2f2cca4f495d66b830b8686.jpg", "http://www.edamam.com/ontologies/edamam.owl#recipe_77719b1deefdfc752d3dd7cc828f255f"
  assert test_me.uri == "http://www.edamam.com/ontologies/edamam.owl#recipe_77719b1deefdfc752d3dd7cc828f255f"
end
test "Image Attribute is set correctly" do
  test_me = MuncherHit.new "Tofu With Crab Sauce","https://www.edamam.com/web-img/d87/d8780bf7c2f2cca4f495d66b830b8686.jpg", "http://www.edamam.com/ontologies/edamam.owl#recipe_77719b1deefdfc752d3dd7cc828f255f"
  assert test_me.image == "https://www.edamam.com/web-img/d87/d8780bf7c2f2cca4f495d66b830b8686.jpg"
end

end
