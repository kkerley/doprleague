class CreateFeatures < ActiveRecord::Migration
  def change
    create_table :features do |t|
      t.string :title
      t.text :content
      t.integer :order
      t.boolean :on_homepage
      t.boolean :show_title
      t.string :feature_type

      t.timestamps
    end
  end
end
