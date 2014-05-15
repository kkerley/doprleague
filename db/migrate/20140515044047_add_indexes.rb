class AddIndexes < ActiveRecord::Migration
  def change
  	add_index :players, :first_name
  	add_index :players, :last_name
  	add_index :players, :auction_value
  	add_index :players, :position
  end

end
