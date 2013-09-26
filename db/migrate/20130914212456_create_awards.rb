class CreateAwards < ActiveRecord::Migration
  def change
    create_table :awards do |t|
      t.text :name
      t.float :amount
      t.integer :user_id

      t.timestamps
    end
  end
end
