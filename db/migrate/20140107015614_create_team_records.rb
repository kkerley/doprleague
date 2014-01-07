class CreateTeamRecords < ActiveRecord::Migration
  def change
    create_table :team_records do |t|
      t.integer :team_id
      t.integer :standing_id
      t.string :rank
      t.string :wlt
      t.float :pct
      t.string :division_record
      t.float :pts_for
      t.float :pts_against
      t.string :streak
      t.integer :moves

      t.timestamps
    end
  end
end
