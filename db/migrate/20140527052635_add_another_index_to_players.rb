class AddAnotherIndexToPlayers < ActiveRecord::Migration
  def change
  	add_index :players, :nfl_team
  end
end
