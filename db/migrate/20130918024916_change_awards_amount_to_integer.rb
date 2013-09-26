class ChangeAwardsAmountToInteger < ActiveRecord::Migration
  def up
    change_column :awards, :amount, :integer
  end

  def down
    change_column :awards, :amount, :float
  end
end
