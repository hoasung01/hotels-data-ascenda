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
        hotel_json = BearHotelPresenter.new(payload: @payload).as_json
        @hotel = SanitizeDataService.new(hotel: hotel_json).()
      when :fish
        hotel_json = FishHotelPresenter.new(payload: @payload).as_json
        @hotel = SanitizeDataService.new(hotel: hotel_json).()
      when :dragon
        hotel_json = DragonHotelPresenter.new(payload: @payload).as_json
        @hotel = SanitizeDataService.new(hotel: hotel_json).()
      end
      self
    end
  end
end