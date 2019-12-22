class HotelSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :destination_id, :name, :description
end
