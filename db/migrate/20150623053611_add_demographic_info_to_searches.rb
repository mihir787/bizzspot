class AddDemographicInfoToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :income_below_poverty, :float
    add_column :searches, :median_income, :float
    add_column :searches, :income_less_than_25, :float
    add_column :searches, :income_between_25_to_50, :float
    add_column :searches, :income_between_50_to_100, :float
    add_column :searches, :income_between_100_to_200, :float
    add_column :searches, :income_greater_200, :float
    add_column :searches, :education_high_school_graduate, :float
    add_column :searches, :education_bachelor_or_greater, :float
  end
end
