module Hotels
  class DataRuleService
    def initialize(dest:, src:)
      @dest = dest
      @src = src
    end

    def call
      @dest.each do |key, value|
        if value.is_a?(String)
          if value.blank?
            @dest[key] = @src[key]
          end
        elsif value.is_a?(Array)
          if value.empty?
            @dest[key] = @src[key]
          end
        elsif value.is_a?(Hash)
          value.keys.each do |nested_key|
            if value[nested_key].is_a?(String)
              if @dest[key][nested_key].blank?
                @dest[key][nested_key] = @src[key][nested_key]
              end
            elsif value[nested_key].is_a?(Array)
              if @dest[key][nested_key].empty?
                @dest[key][nested_key] = @src[key][nested_key]
              end
            end
          end
        end
      end
      @dest
    end
  end
end