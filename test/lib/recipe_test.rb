require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

  test "whether the tests are running" do
    assert true
  end

  #
  # INSTANCE METHODS
  #

  test "Channel can be created with name and ID" do
    name = "test name"
    id = "test id"
    c = Channel.new(name, id)
    assert_equal c.name, name
    assert_equal c.id, id
  end

  #
  # SELF methods
  #

  test "Channel.all should return an array of channels" do
    VCR.use_cassette("channels") do
      channels = Channel.all
      assert_not channels.empty?
      assert_kind_of Array, channels
      channels.each do |channel|
        assert_kind_of Channel, channel
      end
    end
  end

  test "Channel.by_name should return nil if no match" do
    VCR.use_cassette("channels") do
      channel = Channel.by_name("this-channel-does-not-exist")
      assert_nil channel
    end
  end

  test "Channel.by_name should return the only match" do
    VCR.use_cassette("channels") do
      name = "test-api-brackets"
      channel = Channel.by_name(name)
      assert_kind_of Channel, channel
      assert_equal channel.name, name
    end
  end

  # TODO: uncomment me if Slack ever starts giving back duplicate channels
  # test "Channel.by_name should return the first patch" do

  # Dan would have manufactored a new cassette with a duplicate present

  #   name = "test name"
  #   Channel.channels = []
  #   Channel.channels << Channel.new(name, 123)
  #   Channel.channels << CHannel.new(name, 456)
  #
  #   channel = Channel.by_name(name)
  #   assert_kind_of CHannel, channel
  #   assert_equal channel.name, name
  # end

end
