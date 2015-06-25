class AddWalkscoreToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :walkscore, :integer
  end
end
