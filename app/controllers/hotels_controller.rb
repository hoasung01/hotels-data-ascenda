class HotelsController < ApplicationController
  def index
    response = Hotels::ParserDataService.new().()
    render json: response.hotels
  end
end