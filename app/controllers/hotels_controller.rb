class HotelsController < ApplicationController
  def index
    hotels = Hotels::ParserDataService.new().()
    render json: hotels
  end
end