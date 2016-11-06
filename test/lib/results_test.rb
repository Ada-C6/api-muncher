require 'test_helper'
require "results"


class RecipeResultsTest < ActionController::TestCase
  # Just to verify that Rake can pick up the test
  test "the truth" do
    assert true
  end

  # test "You must provide a name & ID for a Slack_Channel" do
  #   assert_raises ArgumentError do
  #     Slack_Channel.new(nil, nil)
  #   end
  #   assert_raises ArgumentError do
  #     Slack_Channel.new("", "")
  #   end
  #   assert_raises ArgumentError do
  #     Slack_Channel.new("", "12354")
  #   end
  #   assert_raises ArgumentError do
  #     Slack_Channel.new("slack-api-test", "")
  #   end
  #   assert_raises ArgumentError do
  #     Slack_Channel.new("slack-api-test", nil)
  #   end
  #   assert_raises ArgumentError do
  #     Slack_Channel.new(nil, "12345")
  #   end
  # end
  #
  # test "Name Attribute is set correctly" do
  #   test_me = Slack_Channel.new("myname","myid")
  #   assert test_me.name == "myname"
  # end
  #
  # test "ID attribut is set correctly" do
  #   test_me = Slack_Channel.new("myname","myid")
  #   assert test_me.id == "myid"
  # end

end
