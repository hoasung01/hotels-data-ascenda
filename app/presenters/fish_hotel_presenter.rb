class FishHotelPresenter
  def initialize(payload:)
    @payload = payload
  end

  def as_json
    Hotel.new.tap do |hotel|
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
  end
end