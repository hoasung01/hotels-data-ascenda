require 'test_helper'

module Hotels
  class CategorizedDataServiceTest < ActiveSupport::TestCase
    def test_categorized_bear_data
      body = File.read(File.join(Rails.root, 'test', 'fixtures', 'bear.json'))
      payload = JSON.parse(body)
      response = CategorizedDataService.new(supplier: :bear, payload: payload).()
      debugger
    end

    def test_categorized_fish_data
    end

    def test_categorized_dragogn_data
    end
  end
end