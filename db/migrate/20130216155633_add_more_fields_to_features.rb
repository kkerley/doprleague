class AddMoreFieldsToFeatures < ActiveRecord::Migration
  def change
    add_column :features, :is_published, :boolean
    add_column :features, :url_path, :string
  end
end
