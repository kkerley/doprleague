class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.string :nfl_team
      t.string :position
      t.integer :auction_value
      t.string :bye_week
      t.integer :team_id
      t.boolean :is_drafted
      t.integer :contract_id
      t.boolean :is_bought_out
      t.integer :bought_out_by_team_id
      t.boolean :is_extended
      t.boolean :is_franchised
      t.boolean :is_dead_money

      t.timestamps
    end
  end
end
