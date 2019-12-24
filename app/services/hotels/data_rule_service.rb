module Hotels
  class DataRuleService
    def initialize(dest:, src:)
      @dest = dest
      @src = src
    end

    def call
      if @dest[:location][:lat].blank?
        @dest[:location][:lat] = @src[:location][:lat]
      end

      if @dest[:location][:lng].blank?
        @dest[:location][:lng] = @src[:location][:lng]
      end

      if @dest[:location][:address].blank?
        @dest[:location][:address] = @src[:location][:address]
      end

      if @dest[:location][:city].blank?
        @dest[:location][:city] = @src[:location][:city]
      end

      if @dest[:location][:country].blank?
        @dest[:location][:country] = @src[:location][:country]
      end

      if @dest[:images][:rooms].blank?
        @dest[:images][:rooms] = @src[:images][:rooms]
      end

      if @dest[:images][:site].blank?
        @dest[:images][:site] = @src[:images][:site]
      end

      if @dest[:images][:amenities].blank?
        @dest[:images][:amenities] = @src[:images][:amenities]
      end

      if @dest[:booking_conditions].blank?
        @dest[:booking_conditions]= @src[:booking_conditions]
      end

      @dest
    end
  end
end