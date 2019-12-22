module Hotels
  class FetchDataService
    TIMEOUT = 10

    def initialize(supplier_url)
      @supplier_url = supplier_url
    end

    def call
      response = RestClient::Request.execute(
        method: :get,
        url: @supplier_url,
        timeout: TIMEOUT
      )
      JSON.parse(response.body)
    rescue RestClient::ExceptionWithResponse => e
      Rails.logger.error("===Can not get data from #{@supplier_url} due to: #{e}===")
      []
    end
  end
end