class CreateDraftRosters < ActiveRecord::Migration
  def change
    create_table :draft_rosters do |t|
      t.string :name
      t.integer :team_id

      t.timestamps
    end
  end
end
