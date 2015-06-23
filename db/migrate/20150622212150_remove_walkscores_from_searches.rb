class RemoveWalkscoresFromSearches < ActiveRecord::Migration
  def change
    remove_column :searches, :walkscores, :string
  end
end
