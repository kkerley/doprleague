class AddBudgetIdsToStipulations < ActiveRecord::Migration
  def change
  	add_column :stipulations, :trader1_budget_id, :integer
  	add_column :stipulations, :trader2_budget_id, :integer

  	add_index :stipulations, [:trader1_budget_id, :trader2_budget_id]
  end
end
