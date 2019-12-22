module Hotels
  class CategorizedDataService
    attr_reader :hotel

    def initialize(supplier:, payload:)
      @supplier = supplier
      @payload = payload
    end

    def call
      case @supplier
      when :bear
        @hotel = Hotel.new(
          @payload['Id'],
          @payload['DestinationId'],
          @payload['Name'],
          @payload['Description']
        )
      when :fish
        @hotel = Hotel.new(
          @payload['hotel_id'],
          @payload['destination_id'],
          @payload['hotel_name'],
          @payload['details']
        )
      when :dragon
        @hotel = Hotel.new(
          @payload['id'],
          @payload['destination'],
          @payload['name'],
          @payload['info']
        )
      end
      self
    end
  end
end