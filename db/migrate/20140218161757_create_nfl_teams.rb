class CreateNflTeams < ActiveRecord::Migration
  def change
    create_table :nfl_teams do |t|
      t.string :name
      t.string :conference

      t.timestamps
    end
  end
end
