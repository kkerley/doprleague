class AddCategoriesToFeatures < ActiveRecord::Migration
  def change
    add_column :features, :category_one_on, :boolean
    add_column :features, :category_two_on, :boolean
    add_column :features, :category_three_on, :boolean
    add_column :features, :category_one_text, :string
    add_column :features, :category_two_text, :string
    add_column :features, :category_three_text, :string
    add_column :features, :category_one_class, :string
    add_column :features, :category_two_class, :string
    add_column :features, :category_three_class, :string
  end
end
