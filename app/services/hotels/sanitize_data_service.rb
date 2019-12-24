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
        elsif value.is_a?(Hash)
          value.keys.each do |nested_key|
            if value[nested_key].is_a?(String)
              @hotel[key][nested_key] = value[nested_key].strip
            elsif value[nested_key].is_a?(Array)
              @hotel[key][nested_key] = value[nested_key].map do |text|
                if text.is_a?(String)
                  text.strip
                elsif text.is_a?(Hash)
                  text
                end
              end
            else
              @hotel[key][nested_key] = value[nested_key]
            end
          end
        end
      end
      @hotel
    end
  end
end