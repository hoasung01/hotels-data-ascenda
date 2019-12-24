class DragonHotelPresenter
  def initialize(payload:)
    @payload = payload
  end

  def as_json
    Hotel.new.tap do |hotel|
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
end