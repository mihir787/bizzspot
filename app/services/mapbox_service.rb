class MapboxService
  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new('http://api.tiles.mapbox.com')
  end

  def location(address)
    add = address.gsub!(" ", "+")
    mapbox_body = parse(connection.get("v4/geocode/mapbox.places/#{add}.json?access_token=pk.eyJ1IjoibWloaXI3ODciLCJhIjoiNDE2NDkzNzdlZTA2N2RjMmM4NWNkNjA1MjIwMGMxNDIifQ.3ggS6ol72ln878GzLZnfDQ").body)
    located = mapbox_body[:features].first
    {address: located[:place_name], coordinates: located[:center]}
  end

  private

  def parse(response)
    JSON.parse(response, symbolize_names: true)
  end

end
