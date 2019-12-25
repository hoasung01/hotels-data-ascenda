require 'test_helper'

module Hotels
  class CategorizedDataServiceTest < ActiveSupport::TestCase
    def test_categorized_bear_data
      body = File.read(File.join(Rails.root, 'test', 'fixtures', 'bear.json'))
      payload = JSON.parse(body)[0]
      response = CategorizedDataService.new(supplier: :bear, payload: payload).()
      assert_respond_to(response, :hotel)
    end

    def test_categorized_fish_data
      body = File.read(File.join(Rails.root, 'test', 'fixtures', 'fish.json'))
      payload = JSON.parse(body)[0]
      response = CategorizedDataService.new(supplier: :fish, payload: payload).()
      assert_respond_to(response, :hotel)
    end

    def test_categorized_dragogn_data
      body = File.read(File.join(Rails.root, 'test', 'fixtures', 'dragon.json'))
      payload = JSON.parse(body)[0]
      response = CategorizedDataService.new(supplier: :dragon, payload: payload).()
      assert_respond_to(response, :hotel)
    end
  end
end