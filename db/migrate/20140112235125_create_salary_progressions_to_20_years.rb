class CreateSalaryProgressionsTo20Years < ActiveRecord::Migration
  def up
  	create_table :salary_progressions do |t|
      t.integer :auction_value
      t.integer :year2
      t.integer :year3
      t.integer :year4
      t.integer :year5
      t.integer :year6
      t.integer :year7
      t.integer :year8
      t.integer :year9
      t.integer :year10
      t.integer :year11
      t.integer :year12
      t.integer :year13
      t.integer :year14
      t.integer :year15
      t.integer :year16
      t.integer :year17
      t.integer :year18
      t.integer :year19
      t.integer :year20

      t.timestamps
    end
  end

  def down
  	drop_table :salary_progressions
  end
end
