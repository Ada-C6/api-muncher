require  'test_helper'

class EdamamApiWrapperTest < ActiveSupport::TestCase
  test "whether the tests are running" do
    assert true
  end

  test "that the search bar retrieves information" do
    VCR.use_cassette("results") do
      results = EdamamApiWrapper.results

      assert_not results.empty?
    end

  end

  # test "that listchannel returns all channels" do
  #   VCR.use_cassette("channels") do
  #     channels = SlackApiWrapper.listchannels
  #     assert_kind_of Array, channels
  #     assert_not channels.empty?
  #     channels.each do |channel|
  #       assert_kind_of Channel, channel
  #     end
  #   end

end
