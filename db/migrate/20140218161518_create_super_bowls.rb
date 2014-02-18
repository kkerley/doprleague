class CreateSuperBowls < ActiveRecord::Migration
  def change
    create_table :super_bowls do |t|
      t.integer :nfl_team1_id
      t.integer :nfl_team2_id
      t.boolean :tie_breaker
      t.integer :nfl_team1_final_score
      t.integer :nfl_team2_final_score
      t.integer :nfl_winner_id
      t.integer :dopr_winner_id

      t.timestamps
    end
  end
end
