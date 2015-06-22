class Api::V1::SearchController < ApplicationController

  def coordinates
    address = params[:address]

    @search = Search.create(address: address)
    render json: @search
  end


  private

  def post_params
    params.require(:post).permit(:description)
  end
end
