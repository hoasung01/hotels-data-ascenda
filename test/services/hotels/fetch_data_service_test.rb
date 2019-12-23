require 'test_helper'

module Hotels
  class FetchDataServiceTest < ActiveSupport::TestCase
    BEAR_URL = SuppliersConstant::SUPPLIERS[:bear]

    def test_call_service_succeed
      @body ||= File.read(File.join(Rails.root, 'test', 'fixtures', 'bear.json'))

      stub_request(:any, BEAR_URL).
        to_return(
          body: @body
        )

      response = FetchDataService.new(
        supplier_url: BEAR_URL
      ).()

      assert_nil(response.error)
      assert_instance_of(Array, response.hotels)
    end

    def test_call_service_failure
      stub_request(:any, BEAR_URL).to_timeout

      response = FetchDataService.new(
        supplier_url: BEAR_URL
      ).()

      assert_nil(response.hotels)
      assert_not_nil(response.error)
    end
  end
end