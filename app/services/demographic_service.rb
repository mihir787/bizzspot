class DemographicService
  attr_reader :connection

  def initialize
    @connection = Faraday.new('http://www.broadbandmap.gov/broadbandmap/')
  end

  def generate_demographics(lat, long)
    parse(connection.get("demographic/2014/coordinates?latitude=#{lat}&longitude=#{long}&format=json").body)[:Results]
  end

  private

  def parse(response)
    JSON.parse(response, symbolize_names: true)
  end
end
