class DemographicService
  attr_reader :connection

  def initialize
    @connection = Hurley::Client.new('http://www.broadbandmap.gov/broadbandmap/')
  end

  def demographics(coordinates)
    located = parse(connection.get("demographic/2014/coordinates?latitude=#{}&longitude=#{}&format=json").body)
  end

  private

  def parse(response)
    JSON.parse(response, symbolize_names: true)
  end
end
