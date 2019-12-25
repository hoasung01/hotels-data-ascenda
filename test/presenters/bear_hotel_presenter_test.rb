require 'test_helper'

class BearHotelPresenterTest < ActiveSupport::TestCase
  def test_presenter_bear_data
    body = File.read(File.join(Rails.root, 'test', 'fixtures', 'bear.json'))
    payload = JSON.parse(body)[0]
    bear_presenter = BearHotelPresenter.new(payload: payload).as_json

    assert_same(payload['Id'], bear_presenter[:id])
    assert_same(payload['DestinationId'], bear_presenter[:destination_id])
    assert_same(payload['Name'], bear_presenter[:name])
    assert_same(payload['Latitude'], bear_presenter[:location][:lat])
    assert_same(payload['Longitude'], bear_presenter[:location][:lng])
    assert_same(payload['Address'], bear_presenter[:location][:address])
    assert_same(payload['City'], bear_presenter[:location][:city])
    assert_same(payload['Country'], bear_presenter[:location][:country])
    assert_same(payload['Description'], bear_presenter[:description])
    assert_same(payload['Facilities'], bear_presenter[:amenities][:general])
  end
end
