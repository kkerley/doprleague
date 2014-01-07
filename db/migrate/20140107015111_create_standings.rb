class CreateStandings < ActiveRecord::Migration
  def change
    create_table :standings do |t|
      t.integer :year

      t.timestamps
    end
  end
end
