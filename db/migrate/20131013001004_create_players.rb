class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :first_name
      t.string :last_name
      t.string :nfl_team
      t.string :position
      t.integer :auction_value
      t.string :bye_week
      t.boolean :is_drafted
      t.boolean :is_dead_money
      
      t.timestamps
    end
  end
end
