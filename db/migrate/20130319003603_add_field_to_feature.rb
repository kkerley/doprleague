class AddFieldToFeature < ActiveRecord::Migration
  def change
    add_column :features, :image_classes, :string
  end
end
