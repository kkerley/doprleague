class AddFieldsToPlayers < ActiveRecord::Migration
  def change
    add_column :players, :is_retired, :boolean, default: false
  end
end
