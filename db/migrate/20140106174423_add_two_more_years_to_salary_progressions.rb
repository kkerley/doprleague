class AddTwoMoreYearsToSalaryProgressions < ActiveRecord::Migration
  def change
    add_column :salary_progressions, :year6, :integer
    add_column :salary_progressions, :year7, :integer
  end
end
