module Hotels
  class ParserDataService
    def initialize
    end

    def call
      hotels = []
      SuppliersConstant::SUPPLIERS.each do |key, value|
        response = FetchDataService.new(supplier_url: value).()
        debugger
        unless response.error.blank?
          response.each do |payload|
            categorized_data = CategorizedDataService.new(supplier: key, payload: payload).()
            hotels << categorized_data
          end
        end
      end
      hotels
    end
  end
end