class AddBooleanFieldsToSubcontracts < ActiveRecord::Migration
  def change
    add_column :subcontracts, :this_is_an_extension, :boolean
    add_column :subcontracts, :this_is_a_franchise_tag, :boolean
  end
end
