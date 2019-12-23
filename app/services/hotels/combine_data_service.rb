module Hotels
  class CombineDataService
    attr_reader :combined_hotels

    def initialize(combined_hotels:, hotel:)
      @combined_hotels = combined_hotels
      @hotel = hotel
    end

    def call
      if @combined_hotels.blank?
        @combined_hotels << @hotel
      else
        process_duplicated_hotel
      end
      self
    end

    private

    def process_duplicated_hotel
      duplicated_hotel = @combined_hotels.find { |x| x[:id] == @hotel[:id] }

      if duplicated_hotel
        duplicated_hotel = revise_rules_for(duplicated_hotel, @hotel)
        @combined_hotels
      else
        @combined_hotels << @hotel
      end
    end

    def revise_rules_for(duplicated_hotel, hotel)
      duplicated_hotel[:location][:lat] = hotel[:location][:lat] if duplicated_hotel[:location][:lat].blank?
      duplicated_hotel[:location][:lng] = hotel[:location][:lng] if duplicated_hotel[:location][:lng].blank?
      if duplicated_hotel[:location][:address].blank? || duplicated_hotel[:location][:address].size < (hotel[:location][:address] || '').size
        duplicated_hotel[:location][:address] = hotel[:location][:address]
      end
      duplicated_hotel[:location][:city] = hotel[:location][:city] if duplicated_hotel[:location][:city].blank?
      if duplicated_hotel[:location][:country].blank? || duplicated_hotel[:location][:country].size < hotel[:location][:country].size
        duplicated_hotel[:location][:country] = hotel[:location][:country]
      end
      duplicated_hotel[:images][:rooms] = hotel[:images][:rooms] if duplicated_hotel[:images][:rooms].blank?
      duplicated_hotel[:images][:site] = hotel[:images][:site] if duplicated_hotel[:images][:site].blank?
      duplicated_hotel[:images][:amenities] = hotel[:images][:amenities]if duplicated_hotel[:images][:amenities].blank?
      duplicated_hotel[:booking_conditions]= hotel[:booking_conditions] if duplicated_hotel[:booking_conditions].blank?
      duplicated_hotel
    end
  end
end