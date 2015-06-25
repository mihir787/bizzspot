class Api::V1::SearchController < ApplicationController

  def coordinates
    address = params[:address]
    @search = Search.create(address: address)
    @search.set_coordinates
    @search.demographic_data
    @search.walkscore_data
    @search.save
    render json: @search
  end

end
