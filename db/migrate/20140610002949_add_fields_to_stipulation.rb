class AddFieldsToStipulation < ActiveRecord::Migration
  def change
    add_column :stipulations, :trade_direction, :string
  end
end
