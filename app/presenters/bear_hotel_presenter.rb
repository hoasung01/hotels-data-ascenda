class BearHotelPresenter
  def initialize(payload:)
    @payload = payload
  end

  def as_json
    Hotel.new.tap do |hotel|
      hotel.id = @payload['Id']
      hotel.destination_id = @payload['DestinationId']
      hotel.name = @payload['Name']
      hotel.location = {
        lat: @payload['Latitude'],
        lng: @payload['Longitude'],
        address: @payload['Address'],
        city: @payload['City'],
        country: @payload['Country']
      }
      hotel.description = @payload['Description']
      hotel.amenities = {
        general: @payload['Facilities'],
        room: []
      }
      hotel.images = {
        rooms: [],
        site: [],
        amenities: []
      }
      hotel.booking_conditions = []
    end.marshal_dump
  end
end