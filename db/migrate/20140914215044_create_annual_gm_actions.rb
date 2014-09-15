class CreateAnnualGmActions < ActiveRecord::Migration
  def change
    create_table :annual_gm_actions do |t|
      t.integer :team_id
      t.integer :year
      t.boolean :has_extended, default: false
      t.integer :extended_player_id
      t.boolean :has_franchised, default: false
      t.integer :franchised_player_id
      t.boolean :has_bought_out, default: false
      t.integer :bought_out_player_id

      t.timestamps
    end
  end
end
