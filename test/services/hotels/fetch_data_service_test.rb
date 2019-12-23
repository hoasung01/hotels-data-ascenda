require 'test_helper'

module Hotels
  class FetchDataServiceTest < ActiveSupport::TestCase
    def bear_url
      @bear_url ||= SuppliersConstant::SUPPLIERS[:bear]
    end

    def test_call_service_succeed
      @body ||= File.read(File.join(Rails.root, 'test', 'fixtures', 'bear.json'))

      stub_request(:any, bear_url).
        to_return(
          body: @body
        )

      response = FetchDataService.new(
        supplier_url: bear_url
      ).()

      assert_nil(response.error)
      assert_instance_of(Array, response.hotels)
    end

    def test_call_service_failure
      stub_request(:any, bear_url).to_timeout

      response = FetchDataService.new(
        supplier_url: bear_url
      ).()

      assert_nil(response.hotels)
      assert_not_nil(response.error)
    end
  end
end