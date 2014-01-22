class AddBooleanToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :this_is_a_buyout, :boolean
  end
end
