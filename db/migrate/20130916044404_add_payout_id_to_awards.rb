class AddPayoutIdToAwards < ActiveRecord::Migration
  def change
    add_column :awards, :payout_id, :integer
  end
end
