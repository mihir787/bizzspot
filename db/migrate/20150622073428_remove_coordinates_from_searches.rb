class RemoveCoordinatesFromSearches < ActiveRecord::Migration
  def change
    remove_column :searches, :coordinates, :float
  end
end
