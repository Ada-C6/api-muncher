require 'test_helper'
require 'api_wrapper'
require 'muncher_hit'

class ApiMuncherWrapperTest < ActionController::TestCase

  test 'Can retreive a list of recipes'  do
    VCR.use_cassette('hits') do
      hits = ApiMuncherWrapper.search("fish", 1, 100)
      # https://api.edamam.com/search?app_id=0125214c&app_key=52458ad285e3511c0fed3c8bc4fbb8fd&q=fish&from=1&to=100

        assert hits.is_a? Array
        assert hits.length > 0
        hits.each do |hit|
          assert hit.is_a? MuncherHit

        end
      end
    end

    # test 'Retrives nil when the token is wrong' do
    #   VCR.use_cassette('bad-token') do
    #     hits =
    #     https://api.edamam.com/search?app_id=00000c&app_key=52458ad285e3511c0fed3c8d&q=fish&from=1&to=100"bad-token"
    #     assert hits == nil
    #   end
    # end


  end#end of class
