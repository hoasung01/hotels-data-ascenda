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
            categorized_data_response = CategorizedDataService.new(supplier: key, payload: payload).()

            combine_data_response = CombineDataService.new(
              combined_hotels: @hotels,
              hotel: categorized_data_response.hotel
            ).()

            @hotels = combine_data_response.combined_hotels
          end
        end
      end
      self
    end
  end
end