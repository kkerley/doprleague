class CreateSubcontracts < ActiveRecord::Migration
  def change
    create_table :subcontracts do |t|
      t.integer :team_id
      t.integer :contract_id
      t.integer :salary_amount
      t.integer :contract_year

      t.timestamps
    end
  end
end
