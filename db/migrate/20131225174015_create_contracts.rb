class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.integer :player_id
      t.integer :contract_start_year
      t.integer :contract_length
      t.boolean :is_bought_out
      t.integer :bought_out_by_team_id
      t.boolean :is_extended
      t.boolean :is_franchised

      t.timestamps
    end
  end
end
