class AddVoidBooleanToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :void, :boolean
  end
end
