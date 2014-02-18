class CreateSuperBowlPicks < ActiveRecord::Migration
  def change
    create_table :super_bowl_picks do |t|
      t.integer :team_id
      t.integer :super_bowl_id
      t.integer :nfl_team_id
      t.integer :combined_total

      t.timestamps
    end
  end
end
