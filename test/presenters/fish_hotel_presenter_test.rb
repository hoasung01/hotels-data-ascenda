require 'test_helper'

class FishHotelPresenterTest < ActiveSupport::TestCase
  def test_presenter_fish_data
    body = File.read(File.join(Rails.root, 'test', 'fixtures', 'fish.json'))
    payload = JSON.parse(body)[0]
    fish_presenter = FishHotelPresenter.new(payload: payload).as_json

    assert_same(payload['hotel_id'], fish_presenter[:id])
    assert_same(payload['destination_id'], fish_presenter[:destination_id])
    assert_same(payload['hotel_name'], fish_presenter[:name])
    assert_same(payload['location']['address'], fish_presenter[:location][:address])
    assert_same(payload['location']['country'], fish_presenter[:location][:country])
    assert_same(payload['details'], fish_presenter[:description])
    assert_same(payload['amenities']['general'], fish_presenter[:amenities][:general])
    assert_same(payload['amenities']['room'], fish_presenter[:amenities][:room])
    assert_same(payload['images']['rooms'], fish_presenter[:images][:rooms])
    assert_same(payload['images']['link'], fish_presenter[:images][:link])
    assert_same(payload['images']['site'], fish_presenter[:images][:site])
    assert_same(payload['booking_conditions'], fish_presenter[:booking_conditions])
  end
end
