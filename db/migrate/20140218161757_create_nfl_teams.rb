class CreateNflTeams < ActiveRecord::Migration
  def change
    create_table :nfl_teams do |t|
      t.string :mascot
      t.string :conference
      t.string :city

      t.timestamps
    end
  end
end
