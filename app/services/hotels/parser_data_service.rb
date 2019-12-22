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
            case key
            when :bear
              hotel = Hotel.new(payload['Id'], payload['DestinationId'], payload['Name'], payload['Description'])
              @hotels << hotel
            when :fish
              hotel = Hotel.new(payload['hotel_id'], payload['destination_id'], payload['hotel_name'], payload['details'])
              @hotels << hotel
            when :dragon
              hotel = Hotel.new(payload['id'], payload['destination'], payload['name'], payload['info'])
              @hotels << hotel
            end
          end
        end
      end
      self
    end
  end
end