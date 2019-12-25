require 'test_helper'

module Hotels
  class SanitizeDataServiceTest < ActiveSupport::TestCase
    def test_strip_string_value
      payload = {
        "Address"=>" 8 Sentosa Gateway, Beach Villas "
      }
      hotel_json = BearHotelPresenter.new(payload: payload).as_json
      @hotel = SanitizeDataService.new(hotel: hotel_json).()
      assert_equal("8 Sentosa Gateway, Beach Villas", @hotel[:location][:address])
    end

    def test_strip_array_value
      payload = {
        "Facilities" => [
          "Pool",
          "BusinessCenter",
          "WiFi ",
          "DryCleaning",
          " Breakfast"
        ]
      }

      hotel_json = BearHotelPresenter.new(payload: payload).as_json
      @hotel = SanitizeDataService.new(hotel: hotel_json).()

      expected_value =[
        "Pool",
        "BusinessCenter",
        "WiFi",
        "DryCleaning",
        "Breakfast"
      ]

      assert_equal(expected_value, @hotel[:amenities][:general])
    end

    def test_strip_hash_value_with_nested_key_is_string
      payload = {
        "location" => {
          "address" => " 8 Sentosa Gateway, Beach Villas, 098269",
          "country" => "Singapore "
        },
        "amenities" => {
          "general" => [
            "outdoor pool",
            "indoor pool",
            "business center",
            "childcare"
          ],
          "room" => [
            "tv",
            "coffee machine",
            "kettle",
            "hair dryer",
            "iron"
          ]
        },
        "images" => {
          "rooms" => [
            {
              "link" => "https://d2ey9sqrvkqdfs.cloudfront.net/0qZF/2.jpg",
              "caption" => "Double room"
            },
            {
              "link" => "https://d2ey9sqrvkqdfs.cloudfront.net/0qZF/3.jpg",
              "caption" => "Double room"
            }
          ],
          "site" => [
            {
              "link" => "https://d2ey9sqrvkqdfs.cloudfront.net/0qZF/1.jpg",
              "caption" => "Front"
            }
          ]
        }
      }

      expected_string_value = "8 Sentosa Gateway, Beach Villas, 098269"

      hotel_json = FishHotelPresenter.new(payload: payload).as_json
      @hotel = SanitizeDataService.new(hotel: hotel_json).()
      assert_equal(expected_string_value, @hotel[:location][:address])
    end

    def test_strip_hash_value_with_nested_key_is_array_and_next_nested_key_is_string
      payload = {
        "location" => {
          "address" => "8 Sentosa Gateway, Beach Villas, 098269",
          "country" => "Singapore "
        },
        "amenities" => {
          "general" => [
            "outdoor pool ",
            " indoor pool",
            "business center  ",
            "childcare"
          ],
          "room" => [
            "tv",
            "   coffee machine",
            "kettle",
            "hair dryer",
            "iron   "
          ]
        },
        "images" => {
          "rooms" => [
            {
              "link" => "https://d2ey9sqrvkqdfs.cloudfront.net/0qZF/2.jpg",
              "caption" => "Double room"
            },
            {
              "link" => "https://d2ey9sqrvkqdfs.cloudfront.net/0qZF/3.jpg",
              "caption" => "Double room"
            }
          ],
          "site" => [
            {
              "link" => "https://d2ey9sqrvkqdfs.cloudfront.net/0qZF/1.jpg",
              "caption" => "Front"
            }
          ]
        }
      }

      expected_general_value = [
        "outdoor pool",
        "indoor pool",
        "business center",
        "childcare"
      ]

      expected_room_value = [
        "tv",
        "coffee machine",
        "kettle",
        "hair dryer",
        "iron"
      ]

      hotel_json = FishHotelPresenter.new(payload: payload).as_json
      @hotel = SanitizeDataService.new(hotel: hotel_json).()
      assert_equal(expected_general_value, @hotel[:amenities][:general])
      assert_equal(expected_room_value, @hotel[:amenities][:room])
    end
  end
end