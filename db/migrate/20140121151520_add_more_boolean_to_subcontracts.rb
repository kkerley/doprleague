class AddMoreBooleanToSubcontracts < ActiveRecord::Migration
  def up
    add_column :subcontracts, :this_is_a_buyout, :boolean
  end

  def down
  	remove_column :subcontracts, :this_is_a_buyout
  end
end
