class RenameFeaturesOrderToHomepageOrder < ActiveRecord::Migration
  def up
      rename_column :features, :order, :homepage_order
  end

  def down
      rename_column :features, :homepage_order, :order
  end
end