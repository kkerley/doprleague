class AdjustContractsAndPlayers < ActiveRecord::Migration
  # Removing fields from the Player model and putting them on the Contract model where they should be 
  def up
  	remove_column :players, :is_dead_money
  	remove_column :players, :is_drafted

  	add_column :contracts, :is_dead_money, :boolean
  	add_column :contracts, :is_drafted, :boolean

  end

  def down
  	add_column :players, :is_dead_money, :boolean
  	add_column :players, :is_drafted, :boolean

	remove_column :contracts, :is_dead_money
  	remove_column :contracts, :is_drafted
  end
end
