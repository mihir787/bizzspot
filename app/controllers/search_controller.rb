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

  def show

  end

  def coordinates
  end

  def index
  end

end
