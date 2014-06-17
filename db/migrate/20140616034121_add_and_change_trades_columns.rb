class AddAndChangeTradesColumns < ActiveRecord::Migration
  def change
    rename_column :trades, :is_accepted, :trader1_accepted
    add_column :trades, :trader2_accepted, :boolean
  end
end
