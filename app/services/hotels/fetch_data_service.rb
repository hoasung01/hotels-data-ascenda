module Hotels
  class FetchDataService
    attr_reader :hotels, :error
    TIMEOUT = 10

    def initialize(supplier_url:)
      @supplier_url = supplier_url
    end

    def call
      begin
        response = RestClient::Request.execute(
          method: :get,
          url: @supplier_url,
          timeout: TIMEOUT
        )
        @hotels = JSON.parse(response.body)
      rescue RestClient::ExceptionWithResponse => e
        Rails.logger.error("===Can not get data from #{@supplier_url} due to: #{e}===")
        @error = e
        []
      end
      self
    end
  end
end