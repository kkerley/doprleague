class CreateBudgets < ActiveRecord::Migration
  def change
    create_table :budgets do |t|
      t.integer :team_id
      t.integer :year
      t.integer :amount, :default => 130

      t.timestamps
    end
  end
end
