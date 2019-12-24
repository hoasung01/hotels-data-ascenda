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
        duplicated_hotel = DataRuleService.new(dest: duplicated_hotel, src: @hotel).()
      else
        @combined_hotels << @hotel
      end

      @combined_hotels
    end
  end
end