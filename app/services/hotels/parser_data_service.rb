module Hotels
  class ParserDataService
    attr_reader :hotels

    def initialize
      @hotels = []
    end

    def call
      SuppliersConstant::SUPPLIERS.each do |key, value|
        response = FetchDataService.new(supplier_url: value).()
        if response.error.blank?
          response.hotels.each do |payload|
            categorized_response = CategorizedDataService.new(supplier: key, payload: payload).()
            @hotels << categorized_response.hotel
          end
        end
      end
      self
    end
  end
end