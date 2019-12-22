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
        @hotel = Hotel.new.tap do |hotel|
          hotel.id = @payload['Id']
          hotel.destination_id = @payload['DestinationId']
          hotel.name = @payload['Name']
          hotel.description = @payload['Description']
          hotel.location = {
            lat: @payload['Latitude'],
            lng: @payload['Longitude'],
            address: @payload['Address'],
            city: @payload['City'],
            country: @payload['Country']
          }
        end.marshal_dump
      when :fish
        @hotel = Hotel.new.tap do |hotel|
          hotel.id = @payload['hotel_id']
          hotel.destination_id = @payload['destination_id']
          hotel.name = @payload['hotel_name']
          hotel.description = @payload['details']
          hotel.location = {
            lat: '',
            lng: '',
            address: @payload['location']['address'],
            city: '',
            country: @payload['location']['country']
          }
        end.marshal_dump
      when :dragon
        @hotel = Hotel.new.tap do |hotel|
          hotel.id = @payload['id']
          hotel.destination_id = @payload['destination']
          hotel.name = @payload['name']
          hotel.description = @payload['info']
          hotel.location = {
            lat: @payload['lat'],
            lng: @payload['lng'],
            address: @payload['address'],
            city: '',
            country: ''
          }
        end.marshal_dump
      end
      self
    end
  end
end