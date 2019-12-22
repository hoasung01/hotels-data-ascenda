module Hotels
  class CategorizedDataService
    def initialize(supplier:, payload:)
      @supplier = supplier
      @payload = payload
    end

    def call
      case @supplier
      when :bear
        Hotel.new(
          id: @payload[:Id],
          destination_id: @payload[:DestinationId],
          name: @payload[:Name],
          description: @payload[:Description],
        )
      when :fish
        Hotel.new(
          id: @payload[:hotel_id],
          destination_id: @payload[:destination_id],
          name: @payload[:hotel_name],
          description: @payload[:details],
        )
      when :dragon
        Hotel.new(
          id: @payload[:id],
          destination_id: @payload[:destination],
          name: @payload[:name],
          description: @payload[:info],
        )
      end
    end
  end
end