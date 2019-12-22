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
          hotel.location = {
            lat: @payload['Latitude'],
            lng: @payload['Longitude'],
            address: sanitize(@payload['Address']),
            city: @payload['City'],
            country: @payload['Country']
          }
          hotel.description = sanitize(@payload['Description'])
          hotel.amenities = {
            general: sanitize(@payload['Facilities']),
            room: []
          }
          hotel.images = {
            rooms: [],
            site: [],
            amenities: []
          }
          hotel.booking_conditions = []
        end.marshal_dump
      when :fish
        @hotel = Hotel.new.tap do |hotel|
          hotel.id = @payload['hotel_id']
          hotel.destination_id = @payload['destination_id']
          hotel.name = @payload['hotel_name']
          hotel.location = {
            lat: '',
            lng: '',
            address: @payload['location']['address'],
            city: '',
            country: @payload['location']['country']
          }
          hotel.description = @payload['details']
          hotel.amenities = {
            general: @payload['amenities']['general'],
            room: @payload['amenities']['room']
          }
          hotel.images = {
            rooms: @payload['images']['rooms'],
            site: @payload['images']['site'],
            amenities: []
          }
          hotel.booking_conditions = @payload['booking_conditions']
        end.marshal_dump
      when :dragon
        @hotel = Hotel.new.tap do |hotel|
          hotel.id = @payload['id']
          hotel.destination_id = @payload['destination']
          hotel.name = @payload['name']
          hotel.location = {
            lat: @payload['lat'],
            lng: @payload['lng'],
            address: @payload['address'],
            city: '',
            country: ''
          }
          hotel.description = @payload['info']
          hotel.amenities = {
            general: @payload['amenities'],
            room: []
          }
          hotel.images = {
            rooms: @payload['images']['rooms'],
            site: [],
            amenities: @payload['images']['amenities']
          }
          hotel.booking_conditions = []
        end.marshal_dump
      end
      self
    end

    private

    def sanitize(data)
      if data.is_a?(Array)
        data.map{ |text| text.strip }
      else
        data.strip
      end
    end
  end
end