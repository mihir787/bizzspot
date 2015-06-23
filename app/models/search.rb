class Search < ActiveRecord::Base

  def set_coordinates
    coordinates = map_results[:coordinates]
    self.lat = coordinates.last
    self.long = coordinates.first
  end

  def demographic_data
    demographic = DemographicService.new
    demographics = demographic.generate_demographics(lat, long)
    assign_demographic_data(demographics)
  end

  def walkscore_data
    walkscore = WalkscoreService.new
    scores = walkscore.score(address, lat, long) rescue nil
    self.walkscore = scores[:walkscore]
  end

  private

  def map_results
    map = MapboxService.new
    map.location(address)
  end

  def formatted_coordinates
    c_array = coordinates.gsub("[", "").gsub("]", "").split(", ")
    [c_array[0], c_array[1]]
  end

  def assign_demographic_data(demographics)
    self.income_below_poverty = demographics["incomeBelowPoverty"]
    self.median_income = demographics["medianIncome"]
    self.income_less_than_25 = demographics["incomeLessThan25"]
    self.income_between_25_to_50 = demographics["incomeBetween25to50"]
    self.income_between_50_to_100 = demographics["incomeBetween50to100"]
    self.income_between_100_to_200 = demographics["incomeBetween100to200"]
    self.income_greater_200 = demographics["incomeGreater200"]
    self.education_high_school_graduate = demographics["educationHighSchoolGraduate"]
    self.education_bachelor_or_greater = demographics["educationBachelorOrGreater"]
  end

end
