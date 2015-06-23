class AddColumnsToSearches < ActiveRecord::Migration
  def self.up
    add_column :searches, :demographic, :string
    add_column :searches, :walkscores, :string
  end

  def self.down
    remove_column :searches, :demographic
    remove_column :searches, :walkscores
  end

end
