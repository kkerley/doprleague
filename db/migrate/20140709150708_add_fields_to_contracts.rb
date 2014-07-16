class AddFieldsToContracts < ActiveRecord::Migration
  def change
    add_column :contracts, :is_longterm_deal, :boolean
  end
end
