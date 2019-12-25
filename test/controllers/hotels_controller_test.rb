require 'test_helper'

class HotelsControllerTest < ActionController::TestCase
  def setup
    bear_url = SuppliersConstant::SUPPLIERS[:bear]
    fish_url = SuppliersConstant::SUPPLIERS[:fish]
    dragon_url = SuppliersConstant::SUPPLIERS[:dragon]

    @body_bear = File.read(File.join(Rails.root, 'test', 'fixtures', 'bear.json'))
    @body_fish = File.read(File.join(Rails.root, 'test', 'fixtures', 'fish.json'))
    @body_dragon = File.read(File.join(Rails.root, 'test', 'fixtures', 'dragon.json'))

    stub_request(:any, bear_url).
      to_return(
        body: @body_bear
      )

    stub_request(:any, fish_url).
      to_return(
        body: @body_fish
      )

    stub_request(:any, dragon_url).
      to_return(
        body: @body_dragon
      )
  end

  def test_index
    get :index
    assert_instance_of(Array, JSON.parse(response.body))
  end

  def test_index_with_hotel_ids_params
    get :index, params: { :hotel_ids => 'iJhz' }
    parsed_json = JSON.parse(response.body)
    assert_not_nil parsed_json.select{ |x| x['id'] == 'iJhz' }
    assert_empty parsed_json.select{ |x| x['id'] == 'SjyX' }
  end

  def test_index_with_dest_id_params
    get :index, params: { :dest_id => 5432 }
    parsed_json = JSON.parse(response.body)
    assert_not_nil parsed_json.select{ |x| x['dest_id'] == 5432 }
    assert_empty parsed_json.select{ |x| x['dest_id'] == 1122 }
  end

  def test_index_with_hotel_ids_and_dest_id_params
    get :index, params: { :hotel_ids => 'iJhz', :dest_id => 5432 }
    parsed_json = JSON.parse(response.body)
    assert_not_nil parsed_json.select{ |x| x['id'] == 'iJhz' && x['dest_id'] == 5432 }
    assert_empty parsed_json.select{ |x| x['id'] == 'SjyX' && x['dest_id'] == 5432 }
  end
end