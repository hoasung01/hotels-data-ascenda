require 'test_helper'

class BearHotelPresenterTest < ActiveSupport::TestCase
  def test_presenter_bear_data
    payload = File.read(File.join(Rails.root, 'test', 'fixtures', 'bear.json'))
    bear_presenter = BearHotelPresenter.new(payload: payload).as_json

    assert_match('Id', bear_presenter[:id])
    assert_match('DestinationId', bear_presenter[:destination_id])
    assert_match('Name', bear_presenter[:name])
    assert_match('Latitude', bear_presenter[:location][:lat])
    assert_match('Longitude', bear_presenter[:location][:lng])
    assert_match('Address', bear_presenter[:location][:address])
    assert_match('City', bear_presenter[:location][:city])
    assert_match('Country', bear_presenter[:location][:country])
    assert_match('Description', bear_presenter[:description])
    assert_match('Facilities', bear_presenter[:amenities][:general])
  end
end
