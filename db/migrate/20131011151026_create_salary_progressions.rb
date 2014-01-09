class CreateSalaryProgressions < ActiveRecord::Migration
  def change
    create_table :salary_progressions do |t|
      t.integer :auction_value
      t.integer :year2
      t.integer :year3
      t.integer :year4
      t.integer :year5
      t.integer :year6
      t.integer :year7

      t.timestamps
    end
  end
end
