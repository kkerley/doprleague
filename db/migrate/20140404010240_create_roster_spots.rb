class CreateRosterSpots < ActiveRecord::Migration
  def change
    create_table :roster_spots do |t|
      t.integer :draft_roster_id
      t.integer :player_id
      t.integer :position

      t.timestamps
    end
  end
end
