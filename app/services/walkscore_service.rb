class WalkscoreService
  attr_reader :connection

  def initialize
    @connection = Faraday.new("http://api.walkscore.com")
  end

  def score(address, lat, long)
    parse(connection.get("/score?format=json&address=#{address}&lat=#{lat}&lon=#{long}&wsapikey=#{ENV['WALKSCORE_KEY']}").body)
  end

  private

  def parse(response)
    JSON.parse(response, symbolize_names: true)
  end
end
