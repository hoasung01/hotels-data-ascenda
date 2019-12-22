class HotelsController < ApplicationController
  def index
    response = Hotels::ParserDataService.new().()
    render json: filtered_for(response.hotels)
  end

  private

  def filtered_for(hotels)
    if params[:hotel_ids].present?
      hotels_ids = params[:hotel_ids].split(',')

      hotels = hotels.select do |hotel|
        hotels_ids.include?(hotel[:id])
      end
    elsif params[:dest_id].present?
      hotels = hotels.select do |hotel|
        hotel[:destination_id] == params[:dest_id].to_i
      end
    end
    hotels
  end
end