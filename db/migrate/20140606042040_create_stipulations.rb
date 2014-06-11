class CreateStipulations < ActiveRecord::Migration
  def change
    create_table :stipulations do |t|
      t.integer :trade_id
      t.integer :year
      t.string :stipulation_type
      t.string :terms
      t.text :description
      t.boolean :rest_of_contract

      t.timestamps
    end
  end
end
