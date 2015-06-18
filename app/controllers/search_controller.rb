class SearchController < ApplicationController
  respond_to :json

  # def coordinates
  #   address = params[:address]
  #   loc = Map.service.location(address)
  #   @search = Search.create(address: loc[:address], coordinates: loc[:coordinates])
  #   redirect_to result_path(@search)
  # end

  # def show
  #   @search = Search.find(params[:id])
  # end

  def coordinates
  end

  def index

  end

end

# @result = {
#   type: 'Feature',
#   geometry: {
#     type: 'Point',
#     coordinates: loc[:coordinates]
#   },
#   properties: {
#     address: loc[:address],
#     'marker-color' => '#00607d',
#     'marker-symbol' => 'circle',
#     'marker-size' => 'medium'
#   }
# }
