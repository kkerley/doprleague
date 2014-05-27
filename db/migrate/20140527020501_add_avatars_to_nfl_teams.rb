class AddAvatarsToNflTeams < ActiveRecord::Migration
  def self.up
    change_table :nfl_teams do |t|
      t.attachment :avatar
    end
  end

  def self.down
    drop_attached_file :nfl_teams, :avatar
  end
end