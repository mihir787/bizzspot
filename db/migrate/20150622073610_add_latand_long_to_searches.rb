class AddLatandLongToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :lat, :float
    add_column :searches, :long, :float
  end
end
