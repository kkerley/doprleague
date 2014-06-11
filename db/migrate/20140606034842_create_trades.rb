class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.integer :trader1_id
      t.integer :trader2_id
      t.boolean :is_accepted
      t.text :notes

      t.timestamps
    end
  end
end
