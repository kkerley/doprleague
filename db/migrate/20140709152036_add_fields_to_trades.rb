class AddFieldsToTrades < ActiveRecord::Migration
  def change
    add_column :trades, :is_rejected, :boolean, default: false
  end
end
