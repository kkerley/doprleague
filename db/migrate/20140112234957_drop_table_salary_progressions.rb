class DropTableSalaryProgressions < ActiveRecord::Migration
  def up
  	drop_table :salary_progressions
  end

  def down
  	raise ActiveRecord::IrreversibleMigration
  end
end
