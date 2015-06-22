class Search < ActiveRecord::Base
  before_save :set_coordinates


  def demographic_data
    demographic = DemographicService.new
    demographic.generate_demographics(formatted_coordinates.last, formatted_coordinates.first)
  end

  def walkscore_data
    walkscore = WalkscoreService.new
    walkscore.score(address, formatted_coordinates[1], formatted_coordinates[0])
  end

  private

  def map_results
    map = MapboxService.new
    map.location(address)
  end

  def set_coordinates
    self.coordinates = map_results[:coordinates] rescue nil
  end

  def formatted_coordinates
    c_array = coordinates.gsub("[", "").gsub("]", "").split(", ")
    [c_array[0].to_f, c_array[1].to_f]
  end
end
