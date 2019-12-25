require 'test_helper'

class DragonHotelPresenterTest < ActiveSupport::TestCase
  def test_presenter_dragon_data
    body = File.read(File.join(Rails.root, 'test', 'fixtures', 'dragon.json'))
    payload = JSON.parse(body)[0]
    dragon_presenter = DragonHotelPresenter.new(payload: payload).as_json

    assert_same(payload['id'], dragon_presenter[:id])
    assert_same(payload['destination'], dragon_presenter[:destination_id])
    assert_same(payload['name'], dragon_presenter[:name])
    assert_same(payload['lat'], dragon_presenter[:location][:lat])
    assert_same(payload['lng'], dragon_presenter[:location][:lng])
    assert_same(payload['address'], dragon_presenter[:location][:address])
    assert_same(payload['amenities'], dragon_presenter[:amenities][:general])
    assert_same(payload['images']['rooms'], dragon_presenter[:images][:rooms])
    assert_same(payload['images']['amenities'], dragon_presenter[:images][:amenities])
  end
end
