class AddFieldsToStipulation < ActiveRecord::Migration
  def change
    add_column :stipulations, :trade_direction, :string
    add_column :stipulations, :player_id, :integer
  end
end
