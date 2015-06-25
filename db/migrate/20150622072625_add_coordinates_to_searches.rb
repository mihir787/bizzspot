class AddCoordinatesToSearches < ActiveRecord::Migration
  def change
    add_column :searches, :coordinates, :float
  end
end
