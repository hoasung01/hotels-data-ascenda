module Hotels
  class SanitizeDataService
    def initialize(hotel:)
      @hotel = hotel
    end

    def call
      @hotel.each do |key, value|
        if value.is_a?(Array)
          @hotel[key] = value.map{ |text| text.strip }
        elsif value.is_a?(String)
          @hotel[key] = value.strip
        end
      end
      @hotel
    end
  end
end