class CreateSearches < ActiveRecord::Migration
  def change
    create_table :searches do |t|
      t.string :address
      t.string :coordinates

      t.timestamps null: false
    end
  end
end
